-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class LIVE_TYPE
   --
   -- Only for class/type with objects at execution time (see also TYPE).
   --

inherit
   HASHABLE
   COMPARABLE
      redefine is_equal
      end
   VISITABLE
      redefine is_equal
      end

insert
   GLOBALS
      redefine is_equal
      end

creation {SMART_EIFFEL}
   make

feature {ANY}
   type: TYPE
         -- The corresponding type object.

   canonical_type_mark: TYPE_MARK
         -- Alias of `type.canonical_type_mark'.

   name: HASHED_STRING
         -- Alias of `type.name'.

   class_text: CLASS_TEXT
         -- Alias `type.class_text'.

   class_text_name: CLASS_NAME
         -- Alias the one of `class_text'.

   id: INTEGER
         -- Id of the receiver to produce C code.

   at_run_time: BOOLEAN
         -- True if `Current' is itself really created (i.e. there are direct instances of
         -- the corresponding `canonical_type_mark' at run time).

   run_time_set: RUN_TIME_SET
         -- The set of all possible dynamic types (existing types at run-time, i.e. with a
         -- corresponding `at_run_time' object) which may be actually returned by an
         -- expression of the `Current' type. This set, which is empty at the beginning of
         -- the compilation process will grow, following the `smart_eiffel.status' evolution.
         -- Thus, if the type of `Current' is a reference type, the `run_time_set' has only
         -- reference run classes elements. If the type of `Current' is an expanded type, the
         -- `run_time_set' has only `Current' as a single element. Futhermore, the size of the
         -- `run_time_set' depends on live assignments (as well as argument passing and creation
         -- statements) that are found in the live code.

   class_invariant: ASSERTION_LIST is
         -- Collected Runnable invariant if any and only is necessary.
      do
         Result := type.class_invariant
      end

   hash_code: INTEGER
         -- Actually, in order to speed up the compiler, this is a cache
         -- for value `name.to_string'.

   generating_type_used: BOOLEAN is
         -- Must the "generating_type" string be generated for this type?
      require
         smart_eiffel.generating_type_used
      do
         Result := at_run_time or else generating_type_level=2
      end

   generator_used: BOOLEAN is
         -- Must the "generator" string be generated for this type?
      require
         smart_eiffel.generator_used
      do
         Result := at_run_time or else generating_type_level>0
      end

   can_be_assigned_to (other: like Current): BOOLEAN is
      do
         if Current = other then
            Result := True
         else
            Result := type.can_be_assigned_to(other.type)
         end
      end

   is_equal (other: like Current): BOOLEAN is
      do
         Result := Current = other
      end

   infix "<" (other: like Current): BOOLEAN is
      do
         Result := id < other.id
      ensure then
         Result = (id < other.id)
      end

   is_generic: BOOLEAN is
      do
         Result := type.is_generic
      ensure
         is_generic and then is_array implies Result
      end

   is_reference: BOOLEAN is
      do
         Result := canonical_type_mark.is_reference
      ensure
         Result = not is_expanded
      end

   is_array: BOOLEAN is
      require
         is_generic
      do
         Result := canonical_type_mark.is_array
      end

   is_native_array: BOOLEAN is
      do
         Result := canonical_type_mark.is_native_array
      end

   accept (visitor: LIVE_TYPE_VISITOR) is
      do
         visitor.visit_live_type(Current)
      end

feature {SMART_EIFFEL, EXTERNAL_FUNCTION}
   collect (fs: FEATURE_STAMP) is
      require
         valid_stamp: fs /= Void
      do
         check
            stamp_has_feature: fs.has_anonymous_feature_for(type)
         end
         if no_dispatch_collect(fs) then
            if smart_eiffel.status.inlining_dynamic_dispatch_done then
               -- No need to collect what's in "when" clauses of "inspect" which are now implementing
               -- dynamic dispatch.
            else
               run_time_set.do_all(agent collect_sub_type(fs, ?))
            end
         end
      ensure
         collected(fs)
      end

feature {}
   collect_sub_type (fs: FEATURE_STAMP; sub_type: LIVE_TYPE) is
      require
         valid_stamp: fs /= Void
         valid_sub_type: sub_type /= Void
      local
         is_new: BOOLEAN
      do
         if sub_type /= Current then
            is_new := sub_type.no_dispatch_collect(fs.resolve_static_binding_for(type, sub_type.type))
            -- TODO: lost `is_new', meaningless?
         end
      end

feature {WHEN_CLAUSE}
   forbid_collecting (fs: FEATURE_STAMP) is
      do
         if not live_features.fast_has(fs) then
            live_features.fast_put(Void, fs)
         end
      end

   allow_collecting (fs: FEATURE_STAMP) is
      do
         if live_features.fast_at(fs) = Void then
            live_features.remove(fs)
         end
      end

feature {ANY}
   collected (fs: FEATURE_STAMP): BOOLEAN is
      do
         Result := live_features.fast_has(fs) or else (is_collecting and then new_features.fast_has(fs))
      end

feature {LIVE_TYPE}
   no_dispatch_collect (fs: FEATURE_STAMP): BOOLEAN is
         -- Collect `fs' for Current LIVE_TYPE only.
         -- Return `True' if it's a new feature for this LIVE_TYPE.
      require
         valid_stamp: fs /= Void
      local
         af: ANONYMOUS_FEATURE; old_count: INTEGER
      do
         check
            stamp_has_feature: fs.has_anonymous_feature_for(type)
         end
         if not live_features.fast_has(fs) then
            check
               collecting: smart_eiffel.status.is_collecting
            end
            af := fs.anonymous_feature(type)
            if is_collecting then
               old_count := new_features.count
               new_features.fast_put(af, fs)
               Result := new_features.count /= old_count
            else
               live_features.add(af, fs)
               if has_been_collected then
                  af.collect(type)
               end
               Result := True
            end
         end
      ensure
         collected(fs)
      end

feature {PRECURSOR_CALL}
   precursor_run_feature (ct: CLASS_TEXT; af: ANONYMOUS_FEATURE): RUN_FEATURE is
      require
         ct /= Void
         af /= Void
      local
         i: INTEGER; s: STRING; fn: FEATURE_NAME
      do
         if precursor_run_features = Void then
            create precursor_run_features.with_capacity(1)
            create precursor_classes.with_capacity(1)
         end
         from
            i := precursor_run_features.upper
         invariant
            precursor_run_features.valid_index(i)
         until
            i < precursor_run_features.lower
               or else (af.feature_text = precursor_run_features.item(i).base_feature.feature_text
                        and then precursor_classes.item(i) = ct)
         loop
            i := i - 1
         end
         if i >= precursor_run_features.lower then
            Result := precursor_run_features.item(i)
         else
            s := once ""
            s.copy(once "_P_")
            ct.id.append_in(s)
            s.extend('_')
            af.feature_text.names.first.mapping_c_in(s)
            --|*** bug if there are synonyms
            create fn.unknown_position(string_aliaser.string(s))
            Result := af.brand_new_run_feature_for(type, fn, True)
            precursor_run_features.add_last(Result)
            precursor_classes.add_last(ct)
            --|*** PH: should fn be saved? just use rf.name?
         end
      ensure
         Result /= Void
         Result.base_feature = af --***Not sure it's true. Needed?
      end

feature {TYPE}
   feature_count: INTEGER is
      do
         Result := live_features.count
      end

feature {LIVE_TYPE, LIVE_TYPE_VISITOR}
   live_features: DICTIONARY[ANONYMOUS_FEATURE, FEATURE_STAMP]
         --|*** PH(12/05/04) it's dangerous to keep here the link between FS and AF (if the AF is changed), but it
         --|speed-up search because live_features.has use he hash code.

   create_function_list: FAST_ARRAY[FEATURE_STAMP]

   precursor_classes: FAST_ARRAY[CLASS_TEXT]

   precursor_run_features: FAST_ARRAY[RUN_FEATURE]

feature {}
   is_collecting: BOOLEAN

   has_been_collected: BOOLEAN

   new_features: DICTIONARY[ANONYMOUS_FEATURE, FEATURE_STAMP] is
      require
         is_collecting
      once
         create {HASHED_DICTIONARY[ANONYMOUS_FEATURE, FEATURE_STAMP]} Result.with_capacity(50)
      end

   generating_type_level: INTEGER

feature {GENERATOR_GENERATING_TYPE}
   set_generating_type_used is
      require
         smart_eiffel.generating_type_used
      do
         generating_type_level := 2
      ensure
         generating_type_used
      end

   set_generator_used is
      require
         smart_eiffel.generator_used
      do
         generating_type_level := generating_type_level.max(1)
      ensure
         generator_used
      end

feature {RUN_FEATURE, LIVE_TYPE}
   registered (rf: RUN_FEATURE): BOOLEAN is
         -- Assertion pupose only.
      local
         i: INTEGER
      do
         from
            Result := True
            i := live_features.lower
         until
            i > live_features.upper or not Result
         loop
            Result := live_features.key(i).has_run_feature_for(type)
            i := i + 1
         end
      ensure
         Result
      end

feature {}
   smart_eiffel_has_all_run_features: BOOLEAN is
         -- Assertion purpose only.
      local
         i: INTEGER
      do
         from
            Result := True
            i := live_features.lower
         until
            i > live_features.upper or else not Result
         loop
            Result := smart_eiffel.registered(live_features.key(i).run_feature_for(type))
            debug
               check
                  Result
               end
            end
            i := i + 1
         end
         if precursor_run_features /= Void then
            from
               i := precursor_run_features.lower
            until
               i > precursor_run_features.upper or else not Result
            loop
               Result := smart_eiffel.registered(precursor_run_features.item(i))
               debug
                  check
                     Result
                  end
               end
               i := i + 1
            end
         end
      ensure
         Result
      end

feature {SMART_EIFFEL} -- Collect:
   forget_previous_collect is
         -- This feature allow to forget all previously collected
         -- features, then a new full collect can be done. It's
         -- useful after optimisation has removed some code.
         -- The type is not at_run_time anymore.
      do
         type.forget_previous_collect
         live_features.clear_count
         run_time_set.reset
         at_run_time := False
         create_blank_internals_used := False
         collect_is_deep_equal_status := need_not_collect_status
         --|*** (PH 28/08/04) should writable_attributes_mem be
         --|reset or is it not yet built?
      ensure
         not at_run_time
      end

   propagate_features is
         -- This propagates in subtypes alive features detected while previous collect cycle, using
         -- dynaminc binding. This means that a newly alive feature will became pending in all sub-types
         -- and then will be collected while the upcoming collect cycle.
         --
      require
         smart_eiffel.status.is_collecting
      local
         i: INTEGER
      do
         --|*** (PH 12/09/04) Propagation order may be improved
         from
            i := 1
         until
            i > run_time_set.count
         loop
            run_time_set.item(i).merge_features_from(Current)
            i := i + 1
         end
         has_been_collected := False
      ensure
         not has_been_collected
      end

   do_collect is
         -- Call collect on all alive features.
      require
         not is_collecting
         not has_been_collected
         smart_eiffel.status.is_collecting
      local
         i: INTEGER; fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE; buffer: STRING; dummy: TYPE
      do
         is_collecting := True
         check
            new_features.is_empty
         end
         if at_run_time and then not create_blank_internals_used then
            create_blank_internals_used := introspection_handler.create_blank_internals_used_by(Current)
            if create_blank_internals_used and then create_blank_internals_instruction = Void then
               create_blank_internals_instruction :=
                  introspection_handler.create_blank_internals_instruction_for(Current)
            end
         end
         from
            i := live_features.lower
         until
            i > live_features.upper
         loop
            debug
               buffer := "Collecting feature "
               buffer.append(name.to_string)
               buffer.extend('.')
               type.get_feature_name(live_features.key(i)).complete_name_in(buffer)
               buffer.extend('%N')
               echo.put_string(buffer)
            end
            live_features.item(i).collect(type)
            i := i + 1
         end
         from --|*** (PH 11/09/04) move this loop to the end of the feature?
         until
            new_features.is_empty
         loop
            af := new_features.item(new_features.upper)
            fs := new_features.key(new_features.upper)
            new_features.fast_remove(fs)
            live_features.add(af, fs)
            af.collect(type)
         end
         is_collecting := False
         has_been_collected := True
         if class_text.invariant_check and then class_invariant /= Void then
            dummy := class_invariant.collect(type)
         end
         if default_create_stamp = Void and then is_user_expanded then
            debug
               echo.put_string(once "Computing default_create for  ")
               echo.put_string(name.to_string)
               echo.put_new_line
            end
            default_create_stamp := type.expanded_default_create_stamp
         end
         if default_create_stamp /= Void then
            collect(default_create_stamp)
         end
         do_collect_native_array_collector
      ensure
         not is_collecting
         has_been_collected
      end

feature {}
   insert_native_array_collector_flag: BOOLEAN is
         -- Is `Current' type under NATIVE_ARRAY_COLLECTOR special treatment?
      do
         Result := native_array_collector_memory = 1
      end

   native_array_collector_memory: INTEGER
         -- To cache `do_collect_native_array_collector' and `insert_native_array_collector_flag' work.

   do_collect_native_array_collector is
      local
         fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE; args: FORMAL_ARG_LIST
      do
         inspect
            native_array_collector_memory
         when -1 then
            -- Nothing to collect.
         when 1 then
            -- Must collect `mark_native_arrays':
            fs := type.feature_stamp_of(mark_native_arrays_name)
            if fs = Void then
               error_handler.append("Internal problem for %"mark_native_arrays%".")
               error_handler.print_as_warning
            else
               collect(fs)
            end
         when 0 then
            native_array_collector_memory := -1
            if not gc_handler.is_off and then type.is_native_array_collector_enabled then
               fs := type.feature_stamp_of(mark_item_name)
               if fs = Void then
                  error_handler.append("Internal problem while searching for %"mark_item%".")
                  error_handler.print_as_warning
               else
                  af := fs.anonymous_feature(type)
                  args := af.arguments
                  if args.name(1).resolve_in(type).generic_list.first.is_reference then
                     native_array_collector_memory := 1
                  end
               end
            end
         end
      ensure
         native_array_collector_memory /= 0
      end

feature {SMART_EIFFEL}
   inline_dynamic_dispatch (code_accumulator: CODE_ACCUMULATOR) is
         -- Note: precursor anonymous features are inlined directly by PRECURSOR_CALLs.
      require
         smart_eiffel.status.collecting_done
         smart_eiffel.status.is_inlining_dynamic_dispatch
      local
         i: INTEGER; af: ANONYMOUS_FEATURE; key: FEATURE_STAMP
      do
         -- "Normal" features:
         from
            i := live_features.lower
         until
            i > live_features.upper
         loop
            af := live_features.item(i).twin
            key := live_features.key(i)
            af.inline_dynamic_dispatch(code_accumulator, type)
            live_features.fast_put(af, key)
            key.update_anonymous_feature(type, af)
            i := i + 1
         end
         type.inline_dynamic_dispatch_for_class_invariant(code_accumulator)
      end

   make_run_features is
         -- Actually adapting.
      require
         smart_eiffel.status.is_adapting
      local
         i: INTEGER; fn: FEATURE_NAME; fs: FEATURE_STAMP
      do
         check
            not_done: not live_features.is_empty implies not live_features.key(1).has_run_feature_for(type)
         end
         -- "Normal" features:
         from
            i := live_features.lower
         until
            i > live_features.upper
         loop
            fs := live_features.key(i)
            fn := type.get_feature_name(fs)
            check
               not fs.has_run_feature_for(type)
            end
            fs.make_run_feature(type, fn)
            check
               smart_eiffel.registered(at(fn))
            end
            i := i + 1
         end
      ensure
         smart_eiffel_has_all_run_features
      end

   adapt_run_features_and_class_invariant is
      require
         smart_eiffel.status.is_adapting
      local
         i, n: INTEGER; rf: RUN_FEATURE
      do
         class_text.obsolete_warning_check(canonical_type_mark.start_position)
         if precursor_run_features = Void then
            n := live_features.count
         else
            n := live_features.count + precursor_run_features.count
         end
         echo.put_string(once "Adapting ")
         echo.put_integer(n)
         echo.put_string(once " feature")
         if n > 1 then
            echo.put_character('s')
         end
         echo.put_string(once " from ")
         echo.put_string(canonical_type_mark.written_mark)
         echo.put_string(once " (magic count = ")
         echo.put_integer(smart_eiffel.magic_count)
         echo.put_string(once ")%N")
         from
            i := live_features.lower
         variant
            live_features.count - i -- live_features.count has to be constant.
         until
            i > live_features.upper
         loop
            rf := live_features.key(i).run_feature_for(type)
            check
               rf.type_of_current.live_type = Current
               rf.type_of_current = type -- just another way to assess the same thing
            end
            rf.adapt
            i := i + 1
         end
         if precursor_run_features /= Void then
            from
               -- Loop this way because new precursor may be created
               -- while adapting.
               i := precursor_run_features.lower
            until
               i > precursor_run_features.upper
            loop
               rf := precursor_run_features.item(i)
               check
                  rf.type_of_current.live_type = Current
                  rf.type_of_current = type -- just another way to assess the same thing
               end
               rf.adapt
               i := i + 1
            end
         end
         type.adapt_class_invariant
      end

feature {LIVE_TYPE}
   merge_features_from (lt: LIVE_TYPE) is
      local
         i: INTEGER; list: like live_features; other_fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE
         parent_type: TYPE
      do
         parent_type := lt.type
         from
            list := lt.live_features
            i := list.lower
         until
            i > list.upper
         loop
            other_fs := list.key(i).resolve_static_binding_for(parent_type, type)
            af := other_fs.anonymous_feature(type)
            live_features.fast_put(af, other_fs)
            i := i + 1
         end
      end

feature {}
   tagged_memory: INTEGER
         -- 0 when not computed, 1 when tagged or -1 when not tagged.

   make (t: like type) is
         -- Where `t' is the associated `type'.
      require
         smart_eiffel.status.is_analyzing
         t /= Void
      local
         i: INTEGER; gl: ARRAY[TYPE]
      do
         create {HASHED_DICTIONARY[ANONYMOUS_FEATURE, FEATURE_STAMP]} live_features.with_capacity(50)
         canonical_type_mark := t.canonical_type_mark
         type := t
         name := t.name
         check
            name = canonical_type_mark.written_name
         end
         hash_code := t.name.hash_code
         class_text := t.class_text
         class_text_name := class_text.name
         t.set_live_type(Current)
         smart_eiffel.register_live_type(Current)
         create actual_clients_.with_capacity(16)
         id := id_provider.item(t.name, class_text.cluster)
         create run_time_set.make(Current)
         to_internals_stamp := type.feature_stamp_of(string_aliaser.hashed_string(as_to_internals))
         if t.is_generic then
            from
               gl := t.generic_list
               i := gl.lower
            until
               i > gl.upper
            loop
               -- Force live_types creation for each generic type
               smart_eiffel.collect_generic(gl.item(i))
               i := i + 1
            end
         end
      end

feature {ANY}
   is_tagged: BOOLEAN is
         -- Is it a tagged one? In other words, is the `id' field part of the object at run time?
      require
         smart_eiffel.is_ready
      do
         if tagged_memory = 0 then
            if is_expanded then
               tagged_memory := -1
            elseif at_run_time then
               if ace.boost then
                  if smart_eiffel.is_tagged(Current) then
                     tagged_memory := 1
                  else
                     tagged_memory := -1
                  end
               else
                  tagged_memory := 1
               end
            else
               tagged_memory := -1
            end
         end
         Result := tagged_memory = 1
      ensure
         tagged_memory /= 0
         Result implies at_run_time
         Result implies not canonical_type_mark.is_expanded
      end

   is_expanded: BOOLEAN is
      do
         Result := type.is_expanded
      end

   is_user_expanded: BOOLEAN is
      do
         Result := type.is_user_expanded
      end

   is_empty_expanded: BOOLEAN is
      require
         is_user_expanded
         smart_eiffel.status.collecting_done
      local
         i: INTEGER
      do
         if writable_attributes_mem /= Void then
            Result := False
         elseif type.has_external_type then
            Result := False
         else
            Result := True
            from
               i := live_features.lower
            until
               i > live_features.upper or else not Result
            loop
               check
                  live_features.item(i) /= Void
               end
               Result := not ({WRITABLE_ATTRIBUTE} ?:= live_features.item(i))
               i := i + 1
            end
         end
      end

feature {GC_HANDLER, TYPE_MARK, TUPLE_TYPE_MARK, WRITABLE_ATTRIBUTE_NAME, CODE_PRINTER, ASSIGNMENT_HANDLER, NATIVE, BUILT_IN_EQ_NEQ, INTROSPECTION_HANDLER, C_HEADER_PASS}
   writable_attributes: ARRAY[RUN_FEATURE_2] is
         -- Computed and ordered array of writable attributes. Storage in C
         -- struct is to be done in reverse order (from `upper' to `lower').
         -- Order is done according to the level of attribute definition in
         -- the inheritance graph to allow more stupid switch to be removed.
      require
         smart_eiffel.status.collecting_done
         at_run_time
      local
         rf: RUN_FEATURE; rf2: RUN_FEATURE_2; i: INTEGER
      do
         if writable_attributes_mem = Void then
            from
               i := live_features.lower
            until
               i > live_features.upper
            loop
               rf := live_features.key(i).run_feature_for(type)
               if rf2 ?:= rf then
                  rf2 ::= rf
                  if writable_attributes_mem = Void then
                     create writable_attributes_mem.with_capacity(4, 1)
                  end
                  writable_attributes_mem.add_last(rf2)
               end
               i := i + 1
            end
            if writable_attributes_mem /= Void then
               sort_wam(writable_attributes_mem)
            end
         end
         Result := writable_attributes_mem
      ensure
         Result /= Void implies not Result.is_empty
      end

feature {ANY}
   dynamic_feature (up_rf: RUN_FEATURE): RUN_FEATURE is
         -- Look for the specialized version of `up_rf' in `Current' type. Assume the `Current' type is a kind of
         -- `up_rf'. The result is the specialized one according to dynamic dispatch rules.
      require
         up_rf.type_of_current.live_type.run_time_set.has(Current) or else up_rf.feature_stamp.has_run_feature_for(type)
      local
         fs: FEATURE_STAMP
      do
         fs := up_rf.feature_stamp.resolve_static_binding_for(up_rf.type_of_current, type)
         Result := fs.run_feature_for(type)
      ensure
         Result.type_of_current.live_type = Current
      end

feature {ANY}
   default_create_stamp: FEATURE_STAMP
         -- If any, the one to be used while creating an object. Actually, this is mostly used
         -- to memorize the default creation procedure to initialize user's expanded types.
         -- (See also `default_create_run_feature'.)

   default_create_run_feature: RUN_FEATURE_3 is
         -- If any, the corresponding one for `default_create_stamp'.
      do
         if default_create_stamp /= Void then
            if default_create_run_feature_memory = Void then
               default_create_run_feature_memory ?= default_create_stamp.run_feature_for(type)
               check
                  default_create_run_feature_memory /= Void
               end
            end
            if not default_create_run_feature_memory.side_effect_free then
               -- The `default_create_run_feature_memory' is actually doing something.
               Result := default_create_run_feature_memory
            end
         end
      end

feature {LOCAL_VAR_LIST, LOCAL_NAME1}
   side_effect_free_default_create: BOOLEAN is
      require
         smart_eiffel.status.collecting_done
         is_user_expanded
      local
         af: ANONYMOUS_FEATURE; e_procedure: E_PROCEDURE
      do
         af := default_create_stamp.anonymous_feature(type)
         e_procedure ?= af
         check
            e_procedure.arguments = Void
         end
         if e_procedure.routine_body = Void then
            Result := e_procedure.local_vars = Void
         end
         --*** (PH 18/08/2008) Should really ensure and rescue part
         --be ignored? compilation mode?
      end

feature {TYPE_MARK}
   gc_mark_to_follow: BOOLEAN is
      local
         i: INTEGER; lt: like Current
      do
         from
            i := run_time_set.count
         until
            Result or else i = 0
         loop
            lt := run_time_set.item(i)
            if lt = Current then
               Result := need_gc_mark
            else
               Result := lt.type.need_gc_mark_function
            end
            i := i - 1
         end
      end

feature {SMART_EIFFEL}
   set_at_run_time is
         -- Set Current `at_run_time' and do needed update of other instances of LIVE_TYPE.
      require
         smart_eiffel.status.is_collecting
         not at_run_time
         class_text.name.to_string = as_typed_internals
            implies not type.generic_list.first.is_deferred
      local
         fs: FEATURE_STAMP
      do
         at_run_time := True
         fs := smart_eiffel.memory_dispose_stamp
         if fs.has_anonymous_feature_for(type) then
            memory_dispose_stamp := fs
            collect(memory_dispose_stamp)
         end
         run_time_set.force_add(Current)
         if name.to_string.is_equal(once "STD_OUTPUT") then
            smart_eiffel.collect_se_atexit(type)
         end
         smart_eiffel.magic_count_increment
         debug
            echo.put_string(once "Type ")
            echo.put_string(type.name.to_string)
            echo.put_string(once " is alive.%N")
         end
      ensure
         at_run_time
         run_time_set.has(Current)
      end

   safety_check is
      require
         for_boost_mode_only_or_asked_for: ace.boost or else ace.safety_check
      local
         rf: RUN_FEATURE; i: INTEGER; c: INSTRUCTION
      do
         from
            i := live_features.lower
         until
            i > live_features.upper
         loop
            rf := live_features.key(i).run_feature_for(type)
            c := rf.routine_body
            if c /= Void then
               c.safety_check(type)
            end
            i := i + 1
         end
         --|*** PH: loop on precursors?
      end

   simplify is
         -- Note: precursor anonymous features are simplified directly by PRECURSOR_CALLs.
      require
         not smart_eiffel.pretty_flag
         not smart_eiffel.short_or_class_check_flag
         smart_eiffel.status.collecting_done
         ace.boost1 or ace.boost2
      local
         i, live_features_count: INTEGER; af1, af2: ANONYMOUS_FEATURE; fs: FEATURE_STAMP
      do
         live_features_count := live_features.count
         from
            i := live_features.lower
         invariant
            live_features.count = live_features_count
         variant
            live_features_count - i
         until
            i > live_features.upper
         loop
            af1 := live_features.item(i)
            fs := live_features.key(i)
            af2 := fs.simplify(type)
            check
               af2 /= Void
            end
            if af1 /= af2 then
               live_features.fast_put(af2, fs)
               smart_eiffel.magic_count_increment
            end
            i := i + 1
         end
      end

   contextual_simplify is
      require
         not smart_eiffel.pretty_flag
         not smart_eiffel.short_or_class_check_flag
         smart_eiffel.is_ready
         smart_eiffel.status.collecting_done
         ace.boost3
      local
         i, live_features_count: INTEGER; af1, af2: ANONYMOUS_FEATURE; fs: FEATURE_STAMP
      do
         live_features_count := live_features.count
         from
            i := live_features.lower
         invariant
            live_features.count = live_features_count
         variant
            live_features.count - i
         until
            i > live_features.upper
         loop
            af1 := live_features.item(i)
            fs := live_features.key(i)
            af2 := fs.contextual_simplify(type)
            if af1 /= af2 then
               live_features.fast_put(af2, fs)
               smart_eiffel.magic_count_increment
            end
            i := i + 1
         end
      end

feature {}
   memory_dispose_stamp: FEATURE_STAMP
         -- Non Void when feature `dispose' has been collected.

feature {GC_HANDLER}
   get_memory_dispose: RUN_FEATURE_3 is
      do
         if memory_dispose_stamp /= Void then
            if memory_dispose_stamp.has_run_feature_for(type) then
               Result ?= memory_dispose_stamp.run_feature_for(type)
               Result := Result.memory_dispose
            end
         end
      end

   gc_define1 is
      require
         not gc_handler.is_off
      do
         if at_run_time then
            canonical_type_mark.gc_define1
         end
      end

   gc_define2 is
      require
         not gc_handler.is_off
      do
         if at_run_time then
            canonical_type_mark.gc_define2
         end
      end

   gc_info_in (str: STRING) is
         -- Produce C code to print GC information.
      require
         not gc_handler.is_off
         gc_handler.info_flag
      do
         if at_run_time then
            canonical_type_mark.gc_info_in(str)
         end
      end

   just_before_gc_mark_in (body: STRING) is
      require
         not gc_handler.is_off
      do
         if at_run_time then
            canonical_type_mark.just_before_gc_mark_in(body)
         end
      end

feature {TYPE_MARK}
   weak_ref_attributes: FAST_ARRAY[RUN_FEATURE_2] is
         -- Attributes of type WEAK_REFERENCE[...].
         -- Void if none found.
         -- XXX OZ+FM: useful if expanded WEAK_REFERENCEs are possible
         -- (not the case now 2003/07/18; to be removed ?)
      local
         rf2: RUN_FEATURE_2; tm: TYPE_MARK; i: INTEGER
      do
         if writable_attributes /= Void then
            from
               i := writable_attributes.upper
            until
               i < writable_attributes.lower
            loop
               rf2 := writable_attributes.item(i)
               tm := rf2.result_type
               if as_weak_reference = tm.class_text_name.to_string then
                  create Result.with_capacity(i + 1)
                  check
                     tm.is_expanded
                  end
                  Result.add_last(rf2)
                  from
                     i := i - 1
                  until
                     i < writable_attributes.lower
                  loop
                     rf2 := writable_attributes.item(i)
                     tm := rf2.result_type
                     if as_weak_reference = tm.class_text_name.to_string then
                        check
                           tm.is_expanded
                        end
                        Result.add_last(rf2)
                     end
                     i := i - 1
                  end
               else
                  i := i - 1
               end
            end
         end
      end

   gc_mark_fixed_size (is_unmarked: BOOLEAN) is
         -- The main purpose is to compute for example the best body for the corresponding
         -- gc_markXXX function (as well as gc_align_markXXX). In fact, this feature can
         -- be called to produce C code when C variable `o' is not NULL and when `o' is of
         -- some concrete type (Tid*) where `id' is the one of the current LIVE_TYPE.
         -- Finally, when `is_unmarked' is True, object `o' is unmarked.
      require
         cpp.pending_c_function
         not gc_handler.is_off
         not canonical_type_mark.is_native_array
         at_run_time
      local
         rf2: RUN_FEATURE_2; t: TYPE; lvtp: LIVE_TYPE; i: INTEGER
      do
         if as_weak_reference = class_text_name.to_string then
            gc_set_fsoh_marked
         else
            wa_buf.clear_count
            wa_cyclic_buf.clear_count
            if writable_attributes /= Void then
               from
                  i := writable_attributes.upper
               until
                  i < writable_attributes.lower
               loop
                  rf2 := writable_attributes.item(i)
                  t := rf2.result_type.type
                  if t.need_gc_mark_function then
                     lvtp := t.live_type
                     wa_cycle.clear_count
                     wa_cycle.add_last(rf2)
                     if lvtp = Current then
                        wa_cyclic_buf.add_last(rf2)
                     else
                        wa_buf.add_last(rf2)
                     end
                  end
                  i := i - 1
               end
            end
            if wa_buf.is_empty and then wa_cyclic_buf.is_empty then
               gc_set_fsoh_marked
            else
               if wa_cyclic_buf.upper >= 0 then
                  cpp.pending_c_function_body.append(once "begin:%N")
               end
               if not is_unmarked then
                  cpp.pending_c_function_body.append(once "if(((gc")
                  id.append_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once "*)o)->header.flag==FSOH_UNMARKED){%N")
               end
               gc_set_fsoh_marked
               from
                  -- Ordinary attributes :
                  i := wa_buf.upper
               until
                  i < 0
               loop
                  rf2 := wa_buf.item(i)
                  mark_attribute(rf2)
                  i := i - 1
               end
               from
                  -- Cyclic attributes :
                  i := wa_cyclic_buf.upper
               until
                  i < 0
               loop
                  rf2 := wa_cyclic_buf.item(i)
                  t := rf2.result_type.type
                  lvtp := t.live_type
                  wa_cycle.clear_count
                  wa_cycle.add_last(rf2)
                  if i = 0 and then wa_cycle.count = 1 and then lvtp.run_time_set.count = 1 and then lvtp.run_time_set.item(1) = Current then
                     cpp.pending_c_function_body.append(once "o=(void*)o->_")
                     cpp.pending_c_function_body.append(rf2.name.to_string)
                     cpp.pending_c_function_body.append(once ";%Nif((o!=NULL)")
                     if is_unmarked then
                        cpp.pending_c_function_body.append(once "&&(((gc")
                        id.append_in(cpp.pending_c_function_body)
                        cpp.pending_c_function_body.append(once "*)o)->header.flag==FSOH_UNMARKED))")
                     else
                        cpp.pending_c_function_body.extend(')')
                     end
                     cpp.pending_c_function_body.append(once "goto begin;%N")
                  else
                     mark_attribute(rf2)
                  end
                  i := i - 1
               end
               if not is_unmarked then
                  cpp.pending_c_function_body.append(once "}%N")
               end
            end
         end
      end

feature {TYPE_MARK}
   gc_align_mark_fixed_size is
         -- Compute the best body for gc_align_markXXX of a fixed_size object.
      require
         cpp.pending_c_function
         not gc_handler.is_off
         not canonical_type_mark.is_native_array
         at_run_time
      do
         cpp.pending_c_function_body.append(once "gc")
         id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "*b=((gc")
         id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "*)(&(c->first_object)));%N%
            %if((c->header.state_type==FSO_STORE_CHUNK)%
            %&&(((char*)p)>=((char*)store")
         id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ")))return;%N%
            %if(((char*)p)>((char*)(b+(c->count_minus_one))))return;%N%
            %if(((char*)p)<((char*)b))return;%N%
            %if(((((char*)p)-((char*)b))%%sizeof(*p))==0){%N%
            %if(p->header.flag==FSOH_UNMARKED){%N%
            %T")
         id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "*o=(&(p->object));%N")
         gc_mark_fixed_size(True)
         cpp.pending_c_function_body.append(once "}%N}%N")
      end

feature {SMART_EIFFEL}
   at (fn: FEATURE_NAME): RUN_FEATURE is
      require
         type.valid_feature_name(fn)
      do
         Result := type.lookup(fn).run_feature_for(type)
      end

feature {ANY}
   copy_stamp: FEATURE_STAMP is
         -- The one of the `copy' feature (which is magically called inside `twin').
      do
         Result := type.copy_stamp
      ensure
         Result /= Void
      end

   copy_run_feature: RUN_FEATURE is
         -- The corresponding one for `copy_stamp'.
      do
         Result := copy_stamp.run_feature_for(type)
      ensure
         Result /= Void
      end

   fully_qualified_name: STRING is
         -- For the corresponding Java class file.
      do
         if fully_qualified_name_memory = Void then
            fully_qualified_name_memory2.copy(ace.executable_name)
            fully_qualified_name_memory2.extend('/')
            fully_qualified_name_memory2.append(unqualified_name)
            create fully_qualified_name_memory.copy(fully_qualified_name_memory2)
         end
         Result := fully_qualified_name_memory
      end

feature {JVM}
   compile_to_jvm is
      require
         at_run_time
      local
         i: INTEGER; rf: RUN_FEATURE
      do
         echo.put_character('%T')
         echo.put_string(name.to_string)
         echo.put_character('%N')
         jvm.start_new_class(Current)
         from
            i := live_features.lower
         until
            i > live_features.upper
         loop
            rf := live_features.key(i).run_feature_for(type)
            jvm.set_current_frame(rf)
            rf.jvm_field_or_method
            i := i + 1
         end
         if precursor_run_features /= Void then
            from
               i := precursor_run_features.upper
            until
               i < precursor_run_features.lower
            loop
               rf := precursor_run_features.item(i)
               jvm.set_current_frame(rf)
               rf.jvm_field_or_method
               i := i - 1
            end
         end
         jvm.prepare_fields
         jvm.prepare_methods
         jvm.finish_class
      end

feature {TYPE_MARK}
   jvm_type_descriptor_in (str: STRING) is
         -- Append in `str' the appropriate JVM type descriptor.
      require
         at_run_time
         run_time_set.has(Current)
      do
         check
            canonical_type_mark.is_user_expanded
         end
         str.extend('L')
         str.append(fully_qualified_name)
         str.extend(';')
      end

feature {RUN_FEATURE, MANIFEST_GENERIC}
   jvm_invoke (idx, stack_level: INTEGER) is
      local
         ctm: like canonical_type_mark
      do
         ctm := canonical_type_mark
         inspect
            ctm.jvm_method_flags
         when 17 then
            code_attribute.opcode_invokevirtual(idx, stack_level)
         when 9 then
            code_attribute.opcode_invokestatic(idx, stack_level)
         end
      end

feature {ANY}
   jvm_basic_new is
         -- Poduce bytecode to push a new created object with the
         -- basic default value (the corresponding creation procedure
         -- if any is not called).
      local
         i, idx: INTEGER; wa: ARRAY[RUN_FEATURE_2]; rf2: RUN_FEATURE_2; t2: TYPE_MARK
         ca: like code_attribute; cp: like constant_pool
      do
         ca := code_attribute
         cp := constant_pool
         idx := jvm_constant_pool_index
         ca.opcode_new(idx)
         ca.opcode_dup
         idx := cp.idx_methodref1(idx, once "<init>", once "()V")
         ca.opcode_invokespecial(idx, -1)
         wa := writable_attributes
         if wa /= Void then
            from
               i := wa.upper
            until
               i < wa.lower
            loop
               rf2 := wa.item(i)
               t2 := rf2.result_type
               if t2.is_user_expanded then
                  ca.opcode_dup
                  t2.type.live_type.jvm_expanded_push_default
                  idx := cp.idx_fieldref(rf2)
                  ca.opcode_putfield(idx, -2)
               end
               i := i - 1
            end
         end
      end

feature {TYPE_MARK, LIVE_TYPE, NATIVE_BUILT_IN}
   jvm_expanded_push_default is
         -- Push the corresponding new user's expanded (either dummy
         -- or not, initializer is automatically applied).
      require
         canonical_type_mark.is_user_expanded
      local
         rf: RUN_FEATURE
      do
         jvm_basic_new
         rf := default_create_run_feature
         if rf /= Void then
            jvm.push_expanded_initialize(rf)
            rf.mapping_jvm
            jvm.pop
         end
      end

feature {NATIVE_BUILT_IN}
   c_deep_twin_body is
      require
         cpp.pending_c_function
         at_run_time
      local
         i: INTEGER; wa: ARRAY[RUN_FEATURE_2]; rf2: RUN_FEATURE_2; lt: LIVE_TYPE; tm: TYPE_MARK
         field_name: STRING; rts: RUN_TIME_SET; internal_c_local: INTERNAL_C_LOCAL
      do
         internal_c_local := cpp.pending_c_function_lock_local(type, once "deeptwin")
         cpp.pending_c_function_body.append(once "se_deep_twin_start();%N")
         if is_reference then
            cpp.pending_c_function_body.append(once "R=se_deep_twin_search((void*)C);%N%
                                                    %if(R == NULL){%N")
            gc_handler.allocation_of(internal_c_local, Current)
            cpp.pending_c_function_body.append(once "R=")
            internal_c_local.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ";%N*((T")
            id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "*)")
            internal_c_local.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ")=*C;%Nse_deep_twin_register(((T0*)C),")
            internal_c_local.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ");%N")
         else
            internal_c_local.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "=*C;%N")
         end
         wa := writable_attributes
         if wa /= Void then
            from
               i := wa.upper
            until
               i < wa.lower
            loop
               rf2 := wa.item(i)
               field_name := rf2.name.to_string
               tm := rf2.result_type.to_static(type)
               if tm.is_reference then
                  lt := tm.type.live_type
                  if lt = Void then
                     rts := Void
                  else
                     rts := lt.run_time_set
                  end
                  if rts /= Void and then rts.count > 0 then
                     cpp.pending_c_function_body.append(once "if(")
                     c_field_access(internal_c_local, field_name)
                     cpp.pending_c_function_body.append(once "!=NULL){%N")
                     c_field_access(internal_c_local, field_name)
                     cpp.pending_c_function_body.extend('=')
                     if rts.count > 1 then
                        cpp.pending_c_function_body.extend('X')
                        rts.owner.id.append_in(cpp.pending_c_function_body)
                     else
                        cpp.pending_c_function_body.extend('r')
                        rts.first.id.append_in(cpp.pending_c_function_body)
                     end
                     cpp.pending_c_function_body.append(once "deep_twin(")
                     if ace.no_check then
                        cpp.pending_c_function_body.append(once "&ds,")
                        if rts.count > 1 then
                           cpp.pending_c_function_body.append(once "ds.p,")
                        end
                     end
                     if rts.count = 1 then
                        cpp.pending_c_function_body.extend('(')
                        rts.first.canonical_type_mark.c_type_for_target_in(cpp.pending_c_function_body)
                        cpp.pending_c_function_body.extend(')')
                     end
                     cpp.pending_c_function_body.extend('(')
                     c_field_access(internal_c_local, field_name)
                     cpp.pending_c_function_body.append(once "));%N}%N")
                  end
               elseif tm.is_native_array then
                  if not type.has_simple_feature_name(capacity_name) then
                     error_handler.add_type_mark(tm)
                     error_handler.add_position(tm.start_position)
                     error_handler.append(fz_dtideena)
                     error_handler.print_as_error
                     error_handler.add_position(rf2.start_position)
                     error_handler.append(em1)
                     error_handler.print_as_fatal_error
                  end
                  c_field_access(internal_c_local, field_name)
                  cpp.pending_c_function_body.append(once "=r")
                  tm.id.append_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once "deep_twin_from(")
                  if ace.no_check then
                     cpp.pending_c_function_body.append(once "&ds,")
                  end
                  c_field_access(internal_c_local, field_name)
                  cpp.pending_c_function_body.extend(',')
                  c_field_access(internal_c_local, as_capacity)
                  cpp.pending_c_function_body.append(once ");%N")
               elseif tm.is_empty_expanded then
               elseif tm.is_user_expanded then
                  c_field_access(internal_c_local, field_name)
                  cpp.pending_c_function_body.append(once "=r")
                  tm.id.append_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once "deep_twin(")
                  if ace.no_check then
                     cpp.pending_c_function_body.append(once "&ds,")
                  end
                  cpp.pending_c_function_body.append(once "&(")
                  c_field_access(internal_c_local, field_name)
                  cpp.pending_c_function_body.append(once "));%N")
               else
                  check
                     tm.is_kernel_expanded
                  end
               end
               i := i - 1
            end
         end
         if is_user_expanded then
            cpp.pending_c_function_body.append(once "R=")
            internal_c_local.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ";%N")
         end
         if is_reference then
            cpp.pending_c_function_body.append(once "}%N")
         end
         cpp.pending_c_function_body.append(once "se_deep_twin_trats()%N")
         internal_c_local.unlock
      end

   is_deep_equal_c_code is
      require
         cpp.pending_c_function
      local
         i: INTEGER; wa: ARRAY[RUN_FEATURE_2]; rf2: RUN_FEATURE_2; ct, tm: TYPE_MARK; field_name: STRING
         check_type: BOOLEAN; lt: LIVE_TYPE; rts: RUN_TIME_SET
      do
         ct := canonical_type_mark
         cpp.pending_c_function_body.append(once "se_deep_equal_start();%N")
         if ct.is_reference then
            check_type := ct.type.live_type.is_tagged
            if check_type then
               cpp.pending_c_function_body.append(once "R=(C->id==a1->id);%Nif(R){%N")
            end
            cpp.pending_c_function_body.append(once "R=se_deep_equal_search(C,a1);%N")
         end
         cpp.pending_c_function_body.append(once "if(!R){%N")
         ct.c_type_for_target_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "a1ptr=")
         if ct.is_reference then
            cpp.pending_c_function_body.append(once "((void*)a1);%N")
         else
            cpp.pending_c_function_body.append(once "((void*)(&a1));%N")
         end
         cpp.pending_c_function_body.append(once "R=1;%N")
         wa := writable_attributes
         if wa /= Void then
            from
               i := wa.upper
            until
               i < wa.lower
            loop
               rf2 := wa.item(i)
               field_name := rf2.name.to_string
               tm := rf2.result_type.to_static(type)
               if tm.is_kernel_expanded then
                  cpp.pending_c_function_body.append(once "if(R)R=((C->_")
                  cpp.pending_c_function_body.append(field_name)
                  cpp.pending_c_function_body.append(once ")==(a1ptr->_")
                  cpp.pending_c_function_body.append(field_name)
                  cpp.pending_c_function_body.append(once "));%N")
               end
               i := i - 1
            end
            from
               i := wa.upper
            until
               i < wa.lower
            loop
               rf2 := wa.item(i)
               field_name := rf2.name.to_string
               tm := rf2.result_type.to_static(type)
               if tm.is_reference then
                  lt := tm.type.live_type
                  if lt = Void then
                     rts := Void
                  else
                     rts := lt.run_time_set
                  end
                  if rts /= Void and then rts.count > 0 then
                     cpp.pending_c_function_body.append(once "if(R){%NT0*o1=C->_")
                     cpp.pending_c_function_body.append(field_name)
                     cpp.pending_c_function_body.append(once ";%NT0*o2=a1ptr->_")
                     cpp.pending_c_function_body.append(field_name)
                     cpp.pending_c_function_body.append(once ";%Nif(o1==o2){}%N%
                                                             %else if(o1==NULL){R=0;}%N%
                                                             %else if(o2==NULL){R=0;}%N%
                                                             %else {R=")
                     if rts.count = 1 then
                        tm := rts.first.canonical_type_mark
                        cpp.pending_c_function_body.extend('r')
                     else
                        cpp.pending_c_function_body.extend('X')
                     end
                     tm.id.append_in(cpp.pending_c_function_body)
                     cpp.pending_c_function_body.append(once "is_deep_equal(")
                     if ace.no_check then
                        cpp.pending_c_function_body.append(once "&ds,")
                        if rts.count > 1 then
                           cpp.pending_c_function_body.append(once "ds.p,")
                        end
                     end
                     if rts.count = 1 then
                        cpp.pending_c_function_body.extend('(')
                        tm.c_type_for_target_in(cpp.pending_c_function_body)
                        cpp.pending_c_function_body.extend(')')
                     end
                     cpp.pending_c_function_body.append(once "o1,o2);}%N}%N")
                  end
               elseif tm.is_native_array then
                  if not type.has_simple_feature_name(capacity_name) then
                     error_handler.add_type_mark(tm)
                     error_handler.add_position(tm.start_position)
                     error_handler.append(fz_dtideena)
                     error_handler.print_as_error
                     error_handler.add_position(rf2.start_position)
                     error_handler.append(em1)
                     error_handler.print_as_fatal_error
                  end
                  cpp.pending_c_function_body.append(once "if(R)R=r")
                  tm.id.append_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once "deep_memcmp(")
                  if ace.no_check then
                     cpp.pending_c_function_body.append(once "&ds,")
                  end
                  cpp.pending_c_function_body.append(once "C->_")
                  cpp.pending_c_function_body.append(field_name)
                  cpp.pending_c_function_body.append(once ",a1ptr->_")
                  cpp.pending_c_function_body.append(field_name)
                  cpp.pending_c_function_body.append(once ",C->_capacity);%N")
               elseif tm.is_empty_expanded then
               elseif tm.is_user_expanded then
                  cpp.pending_c_function_body.append(once "if(R)R=r")
                  tm.id.append_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once "is_deep_equal(")
                  if ace.no_check then
                     cpp.pending_c_function_body.append(once "&ds,")
                  end
                  cpp.pending_c_function_body.append(once "&(C->_")
                  cpp.pending_c_function_body.append(field_name)
                  cpp.pending_c_function_body.append(once "),a1ptr->_")
                  cpp.pending_c_function_body.append(field_name)
                  cpp.pending_c_function_body.append(once ");%N")
               end
               i := i - 1
            end
         end
         if check_type then
            cpp.pending_c_function_body.append(once "}%N")
         end
         cpp.pending_c_function_body.append(once "}%Nse_deep_equal_trats()%N")
      end

feature {JVM}
   unqualified_name: STRING is
         -- Also used for the corresponding file name.
      do
         unqualified_name_memory.copy(name.to_string)
         unqualified_name_memory.to_lower
         unqualified_name_memory.replace_all('[', 'O')
         unqualified_name_memory.replace_all(']', 'F')
         unqualified_name_memory.replace_all(' ', '_')
         unqualified_name_memory.replace_all(',', '_')
         Result := unqualified_name_memory
      end

feature {ANY}
   jvm_constant_pool_index: INTEGER is
         -- The fully qualified index in the constant pool.
      do
         Result := constant_pool.idx_class2(fully_qualified_name)
      end

feature {SMART_EIFFEL}
   id_extra_information (tfw: TEXT_FILE_WRITE) is
      local
         ct: TYPE_MARK
      do
         ct := canonical_type_mark
         tfw.put_string(once "c-type: T")
         tfw.put_integer(id)
         tfw.put_character(' ')
         ct.id_extra_information(tfw)
         if ct.is_reference then
            tfw.put_string(once "ref-status: ")
            if at_run_time then
               tfw.put_string(once "live id-field: ")
               if ct.is_reference and then not is_tagged then
                  tfw.put_string(once "no ")
               else
                  tfw.put_string(once "yes ")
               end
            else
               tfw.put_string(once "dead ")
            end
            tfw.put_character('%N')
         end
         assignment_handler.id_extra_information(tfw, Current)
         run_time_set.id_extra_information(tfw)
      end

feature {C_PRETTY_PRINTER}
   prepare_introspection is
      require
         ace.no_check
      local
         i: INTEGER; put_else: BOOLEAN; rf: RUN_FEATURE; ct, t: TYPE_MARK
      do
         if at_run_time then
            cpp.prepare_c_function
            ct := canonical_type_mark
            cpp.pending_c_function_signature.append(once "void* se_introspecT")
            id.append_in(cpp.pending_c_function_signature)
            cpp.pending_c_function_signature.append(once "(T")
            ct.id.append_in(cpp.pending_c_function_signature)
            if ct.is_reference then
               cpp.pending_c_function_signature.extend('*')
            end
            cpp.pending_c_function_signature.append(once "*C,char*attr,int*id,int*exp)")
            cpp.pending_c_function_body.append(once "void*R=NULL;%N")
            if ct.is_native_array then
               -- NATIVE_ARRAY: support access to an element
               check
                  ct.is_generic
                  ct.generic_list.count = 1
               end
               t := ct.generic_list.first
               if t.is_expanded then
                  cpp.pending_c_function_body.append(once "*id=")
                  t.id.append_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once ";%N*exp=1;%N")
               else
                  cpp.pending_c_function_body.append(once "*exp=0;%N")
               end
               cpp.pending_c_function_body.append(once "R=(*((")
               t.c_type_for_result_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once "**)C)+atoi(attr));%N")
               if t.type.live_type.run_time_set.count > 1 then
                  cpp.pending_c_function_body.append(once "*id=(*((T0**)R))->id;%N")
               else
                  cpp.pending_c_function_body.append(once "*id=")
                  t.id.append_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once ";%N")
               end
            else
               -- General case: support access to attributes and once queries
               cpp.pending_c_function_body.append(once "*id=-1;%N")
               from
                  put_else := False
                  i := live_features.lower
               until
                  i > live_features.upper
               loop
                  rf := live_features.key(i).run_feature_for(type)
                  put_else := rf.prepare_introspection(put_else)
                  i := i + 1
               end
               --|*** PH: loop on precursors?
            end
            cpp.pending_c_function_body.append(once "return R;%N")
            cpp.dump_pending_c_function(True)
         end
      end

   prepare_introspection2 is
      require
         ace.no_check
         cpp.pending_c_function
      local
         i: INTEGER; put_coma: BOOLEAN; rf: RUN_FEATURE; ct: TYPE_MARK
      do
         if at_run_time then
            ct := canonical_type_mark
            cpp.pending_c_function_body.append(once "se_atT[")
            ct.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "]=")
            from
               put_coma := False
               i := live_features.lower
            until
               i > live_features.upper
            loop
               rf := live_features.key(i).run_feature_for(type)
               put_coma := rf.prepare_introspection2(put_coma)
               i := i + 1
            end
            --|*** PH: loop on precursors?
            if not put_coma then
               cpp.pending_c_function_body.append(once "NULL")
            else
               cpp.pending_c_function_body.extend('"')
            end
            cpp.pending_c_function_body.append(once ";%N")
         end
      end

feature {RUN_FEATURE_2, RUN_FEATURE_6}
   c_return_introspect (rf2: RUN_FEATURE_2; rf6: RUN_FEATURE_6) is
      require
         (rf2 /= Void) xor (rf6 /= Void)
         cpp.pending_c_function
         ace.no_check
      local
         i, t: INTEGER; rts: like run_time_set; tm: TYPE_MARK; s: STRING
      do
         rts := run_time_set
         inspect
            rts.count
         when 0 then
            -- nothing
         when 1 then
            tm := rts.first.canonical_type_mark
            s := c_pointer_to_type(tm)
            t := tm.id
            if tm.is_expanded then
               cpp.pending_c_function_body.append(once "*exp=1;%N")
            else
               cpp.pending_c_function_body.append(once "*exp=0;%N")
            end
            cpp.pending_c_function_body.append(once "*id=")
            t.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ";%N{%Nstatic ")
            cpp.pending_c_function_body.append(s)
            cpp.pending_c_function_body.append(once " _r=")
            tm.c_initialize_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ";%N_r=")
            if tm.is_reference then
               cpp.pending_c_function_body.extend('(')
               cpp.pending_c_function_body.append(s)
               cpp.pending_c_function_body.extend(')')
            end
            cpp.pending_c_function_body.extend('(')
            if rf2 /= Void then
               rf2.mapping_c_inside_introspect
            else
               once_routine_pool.unique_result_in(cpp.pending_c_function_body, rf6.base_feature)
            end
            cpp.pending_c_function_body.append(once ");%NR=&_r;%N}%N")
         else
            cpp.pending_c_function_body.append(once "{%Nstatic T0*_r=NULL;%N_r=")
            if rf2 /= Void then
               rf2.mapping_c_inside_introspect
            else
               once_routine_pool.unique_result_in(cpp.pending_c_function_body, rf6.base_feature)
            end
            cpp.pending_c_function_body.append(once ";%Nif (_r==NULL) {R=&_r; *id=0;} else {%Nswitch(_r->id) {%N")
            from
               i := 1
            until
               i > rts.count
            loop
               t := rts.item(i).canonical_type_mark.id
               cpp.pending_c_function_body.append(once "case ")
               t.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once ":%N")
               i := i + 1
            end
            cpp.pending_c_function_body.append(once "*id=_r->id;R=&_r;break;%Ndefault:break;%N}%N}%N}%N")
         end
      end

feature {}
   c_pointer_to_type (t: TYPE_MARK): STRING is
      do
         Result := once "                "
         Result.copy(once "T")
         t.id.append_in(Result)
         if t.is_reference then
            Result.extend('*')
         end
      end

feature {C_LIVE_TYPE_COMPILER}
   actual_clients: TRAVERSABLE[LIVE_TYPE] is
      do
         Result := actual_clients_
      end

feature {}
   actual_clients_: HASHED_SET[LIVE_TYPE]

feature {RUN_FEATURE}
   add_client (lt: LIVE_TYPE) is
      require
         lt /= Void
      do
         actual_clients_.fast_add(lt)
      end

feature {C_PRETTY_PRINTER, LIVE_TYPE}
   structure_signature: STRING is
         -- Terse description of the C struct. Used for recompilation comments.
      require
         at_run_time
         smart_eiffel.is_ready
      local
         wa: like writable_attributes; i, ref_count: INTEGER; lt: LIVE_TYPE; ketm: KERNEL_EXPANDED_TYPE_MARK
      do
         if structure_signature_memory = Void then
            create Result.make_empty
            structure_signature_memory := Result
            if canonical_type_mark.is_kernel_expanded then
               ketm ::= canonical_type_mark
               Result.extend(ketm.structure_mark)
            elseif is_native_array then
               Result.extend('p')
            elseif canonical_type_mark.is_agent then
               Result.extend('a')
            elseif writable_attributes = Void then
               Result.extend('i')
            else
               if is_tagged then
                  Result.extend('i')
               end
               from
                  wa := writable_attributes
                  i := wa.upper
               until
                  i < wa.lower
               loop
                  lt := wa.item(i).type_of_current.live_type
                  if lt.is_reference then
                     ref_count := ref_count + 1
                  else
                     if ref_count = 1 then
                        Result.extend('p')
                     elseif ref_count > 0 then
                        ref_count.append_in(Result)
                        Result.extend('p')
                     end
                     ref_count := 0
                     Result.append(lt.structure_signature)
                  end
                  i := i - 1
               end
               if ref_count = 1 then
                  Result.extend('p')
               elseif ref_count > 0 then
                  ref_count.append_in(Result)
                  Result.extend('p')
               end
            end
         else
            Result := structure_signature_memory
         end
      end

feature {}
   structure_signature_memory: STRING

feature {ANY}
   wa_buf: FAST_ARRAY[RUN_FEATURE_2] is
      once
         create Result.with_capacity(24)
      end

   wa_cyclic_buf: FAST_ARRAY[RUN_FEATURE_2] is
      once
         create Result.with_capacity(24)
      end

feature {LIVE_TYPE, EXTERNAL_FUNCTION}
   collect_deep_twin is
      local
         i: INTEGER; af: ANONYMOUS_FEATURE; wa: WRITABLE_ATTRIBUTE; lt: LIVE_TYPE
      do
         if not collecting_deep_twin then
            collecting_deep_twin := True
            smart_eiffel.set_deep_twin_used
            if as_native_array = class_text.name.to_string then
               collect(type.feature_stamp_of(deep_twin_from_name))
               type.generic_list.first.live_type.collect_deep_twin
            else
               collect(any_deep_twin_fs.resolve_static_binding_for(smart_eiffel.type_any, type))
               from
                  i := live_features.lower
               until
                  i > live_features.upper
               loop
                  af := live_features.item(i)
                  if wa ?:= af then
                     wa ::= af
                     lt := wa.result_type.resolve_in(type).live_type
                     if lt /= Void then
                        lt.collect_deep_twin
                     end
                  end
                  i := i + 1
               end
            end
            collecting_deep_twin := False
         end
      end

feature {}
   collecting_deep_twin: BOOLEAN

feature {EXTERNAL_FUNCTION, LIVE_TYPE}
   collect_is_deep_equal is
      do
         if collect_is_deep_equal_status = need_not_collect_status then
            collect_is_deep_equal_status := must_collect_status
            smart_eiffel.set_deep_twin_used
         end
      end

feature {SMART_EIFFEL, LIVE_TYPE}
   do_collect_is_deep_equal is
      local
         i: INTEGER; af: ANONYMOUS_FEATURE; wa: WRITABLE_ATTRIBUTE; lt: LIVE_TYPE
      do
         if collect_is_deep_equal_status = must_collect_status then
            collect_is_deep_equal_status := already_collected_status
            if as_native_array = class_text.name.to_string then
               collect(type.feature_stamp_of(deep_memcmp_name))
               lt := type.generic_list.first.live_type
               lt.collect_is_deep_equal
               lt.do_collect_is_deep_equal
            else
               collect(any_is_deep_equal_fs.resolve_static_binding_for(smart_eiffel.type_any, type))
               from
                  i := live_features.lower
               until
                  i > live_features.upper
               loop
                  af := live_features.item(i)
                  if wa ?:= af then
                     wa ::= af
                     lt := wa.result_type.resolve_in(type).live_type
                     if lt /= Void then
                        lt.collect_is_deep_equal
                        lt.do_collect_is_deep_equal
                     end
                  end
                  i := i + 1
               end
            end
         end
      end

feature {}
   collect_is_deep_equal_status: INTEGER_8

   need_not_collect_status: INTEGER_8 is 0

   must_collect_status: INTEGER_8 is 1

   already_collected_status: INTEGER_8 is 2

feature {LIVE_TYPE}
   is_wa_cycle (origin: like Current): BOOLEAN is
      do
         if Current = origin then
            Result := True
         end
      end

feature {ANY} -- Some useful JVM opcode:
   opcode_checkcast_1 is
         -- Produces a `checkcast' opcode
      local
         ct: TYPE_MARK; idx: INTEGER
      do
         ct := canonical_type_mark
         idx := jvm_constant_pool_index
         code_attribute.opcode_checkcast(idx)
      end

   opcode_checkcast is
         -- May produce a `checkcast' opcode depending on
         -- `canonical_type_mark' Java byte-code mapping.
      local
         ct: TYPE_MARK; idx: INTEGER
      do
         ct := canonical_type_mark
         if ct.is_kernel_expanded then
         elseif ct.is_native_array then
            tmp_string.clear_count
            ct.jvm_target_descriptor_in(tmp_string)
            idx := constant_pool.idx_class2(tmp_string)
            code_attribute.opcode_checkcast(idx)
         else
            idx := jvm_constant_pool_index
            code_attribute.opcode_checkcast(idx)
         end
      end

   opcode_instanceof is
      require
         not canonical_type_mark.is_kernel_expanded
      local
         idx: INTEGER
      do
         idx := jvm_constant_pool_index
         code_attribute.opcode_instanceof(idx)
      end

   opcode_getfield (rf2: RUN_FEATURE_2): INTEGER is
         -- Produce a `checkcast'/`getfield' for the given
         -- attribute of the top object of the stack.
         -- stack: ... object => ... value
      local
         idx: INTEGER
      do
         opcode_checkcast
         idx := constant_pool.idx_fieldref(rf2)
         Result := rf2.result_type.jvm_stack_space - 1
         code_attribute.opcode_getfield(idx, Result)
      end

feature {CREATE_EXPRESSION}
   create_function_register (fs: FEATURE_STAMP) is
         -- Register that there is a live create expression which creates `Current' type objects at
         -- run-time using `fs' as the creation procedure. Also not that `fs' can be Void in the case of
         -- a create expression with no call.
      do
         if create_function_list = Void then
            create create_function_list.with_capacity(4)
         end
         if fs /= Void then
            if not create_function_list.fast_has(fs) then
               create_function_list.add_last(fs)
            end
         end
      end

feature {INTROSPECTION_HANDLER}
   create_blank_internals_instruction: CREATE_INSTRUCTION

   create_blank_internals_used: BOOLEAN

   to_internals_stamp: FEATURE_STAMP

feature {}
   c_field_access (internal_c_local: INTERNAL_C_LOCAL; field_name: STRING) is
      do
         if is_reference then
            cpp.pending_c_function_body.append(once "((T")
            id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "*)")
            internal_c_local.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ")->_")
         elseif is_native_array then
            internal_c_local.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "->_")
         else
            internal_c_local.append_in(cpp.pending_c_function_body)
            check
               is_user_expanded
            end
            cpp.pending_c_function_body.append(once "._")
         end
         cpp.pending_c_function_body.append(field_name)
      end

   default_create_run_feature_memory: like default_create_run_feature
         -- To cache `default_create_run_feature' computation.

   mark_attribute (rf2: RUN_FEATURE_2) is
      require
         cpp.pending_c_function
      local
         attribute_type: LIVE_TYPE; field_name: STRING
      do
         attribute_type := rf2.result_type.type.live_type
         if attribute_type = Void then
            -- Access to the attribute actually exist, but this is always Void because no creation
            -- exists for the corresponding type.
            -- Yes, this is possible `simplify', but this test can stay there.
         else
            field_name := once "............ unique local buffer ..................."
            field_name.copy(once "o->_")
            field_name.append(rf2.name.to_string)
            cpp.recompilation_comment(Current)
            if insert_native_array_collector_flag and then attribute_type.is_native_array then
               cpp.pending_c_function_body.append(once "{%NT")
               attribute_type.id.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once " na=")
               cpp.pending_c_function_body.append(field_name)
               cpp.pending_c_function_body.append(once "[
                  ;
                  if(gc_find_chunk(na)!=NULL){/* non external NA */
                     rsoh*h=((rsoh*)na)-1;
                     if((h->header.magic_flag)==RSOH_UNMARKED){
                        h->header.magic_flag=RSOH_MARKED;

                  ]")
               cpp.pending_c_function_body.append(once "r")
               id.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once "mark_native_arrays(")
               if not ace.boost then
                  -- Hope there is no bug in `mark_native_arrays'...
                  cpp.pending_c_function_body.append(once "NULL,")
               end
               if ace.profile then
                  cpp.pending_c_function_body.append(once "NULL,")
               end
               cpp.pending_c_function_body.append(once "o);%N}%N}%N}")
            else
               gc_handler.mark_for(field_name, attribute_type, False)
            end
         end
      end

   gc_set_fsoh_marked is
      require
         cpp.pending_c_function
      do
         if canonical_type_mark.is_reference then
            cpp.pending_c_function_body.append(once "((gc")
            id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "*)o)->header.flag=FSOH_MARKED;%N")
         end
      end

   need_gc_mark: BOOLEAN is
      require
         at_run_time
      local
         i: INTEGER; wa: like writable_attributes; rf2: RUN_FEATURE_2
      do
         wa := writable_attributes
         if wa /= Void then
            from
               i := wa.upper
            until
               Result or else i < wa.lower
            loop
               rf2 := wa.item(i)
               Result := rf2.result_type.type.need_gc_mark_function
               i := i - 1
            end
         end
      end

   wa_cycle: FAST_ARRAY[RUN_FEATURE_2] is
      once
         create Result.with_capacity(24)
      end

   tmp_string: STRING is
      once
         create Result.make(32)
      end

   c_code_buffer: STRING is
      once
         create Result.make(256)
      end

   sort_wam (wam: like writable_attributes) is
         -- Sort `wam' to common attribute at the end.
      require
         wam.lower = 1
      local
         min_sort, max_sort, bubble: INTEGER; moved: BOOLEAN
      do
         from
            max_sort := wam.upper
            min_sort := 1
            moved := True
         until
            not moved
         loop
            moved := False
            if max_sort - min_sort > 0 then
               from
                  bubble := min_sort + 1
               until
                  bubble > max_sort
               loop
                  if gt(wam.item(bubble - 1), wam.item(bubble)) then
                     wam.swap(bubble - 1, bubble)
                     moved := True
                  end
                  bubble := bubble + 1
               end
               max_sort := max_sort - 1
            end
            if moved and then max_sort - min_sort > 0 then
               from
                  moved := False
                  bubble := max_sort - 1
               until
                  bubble < min_sort
               loop
                  if gt(wam.item(bubble), wam.item(bubble + 1)) then
                     wam.swap(bubble, bubble + 1)
                     moved := True
                  end
                  bubble := bubble - 1
               end
               min_sort := min_sort + 1
            end
         end
      end

   gt (rf1, rf2: RUN_FEATURE_2): BOOLEAN is
         -- True if it is better to set attribute `rf1' before attribute `rf2'.
      local
         bc1, bc2: CLASS_TEXT; bf1, bf2: ANONYMOUS_FEATURE; bcn1, bcn2: CLASS_NAME
      do
         if rf1.order /= rf2.order then
            Result := rf1.order < rf2.order
         else
            bf1 := rf1.base_feature
            bf2 := rf2.base_feature
            bc1 := bf1.class_text
            bc2 := bf2.class_text
            bcn1 := bc1.name
            bcn2 := bc2.name
            if bcn1.to_string = bcn2.to_string then
               Result := bf1.start_position.before(bf2.start_position)
            elseif bcn2.get_export_permission_of(bcn1) then
               Result := True
            elseif bcn1.get_export_permission_of(bcn2) then
               check
                  not Result
               end
            elseif bc1.parent_lists = Void then
               if bc2.parent_lists = Void then
                  Result := bcn1.to_string < bcn2.to_string
               else
                  Result := True
               end
            elseif bc2.parent_lists = Void then
            else
               Result := bc2.parent_lists.inherit_count < bc1.parent_lists.inherit_count
            end
         end
      end

   writable_attributes_mem: like writable_attributes

   unqualified_name_memory: STRING is
      once
         create Result.make(32)
      end

   fully_qualified_name_memory: STRING

   fully_qualified_name_memory2: STRING is
      once
         create Result.make(256)
      end

   em1: STRING is "The `deep_twin'/`is_deep_equal' problem comes from this attribute."

invariant
   type.live_type = Current

   name /= Void

   canonical_type_mark.is_static

   class_text = type.class_text

   precursor_run_features = Void = (precursor_classes = Void)

   precursor_run_features /= Void implies precursor_run_features.count = precursor_classes.count

   precursor_run_features /= Void implies not precursor_run_features.is_empty

end -- class LIVE_TYPE
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
