class TEST_AGENT71

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   data: AVL_DICTIONARY[STRING, INTEGER] is
      once
         create Result.make
         Result.add("foo", 1)
         Result.add("bar", 0)
         Result.add("duck", 2)
      end

   make is
      local
         checker: PREDICATE[TUPLE[STRING, INTEGER]]
         expected: FAST_ARRAY[STRING]
      do
         expected := {FAST_ARRAY[STRING] << "bar", "foo", "duck" >> }
         checker := agent (actual: STRING; index: INTEGER): BOOLEAN is
                       do
                          Result := actual.is_equal(expected.item(index))
                       end(?, ?)
         assert(data.count = expected.count)
         assert(data.for_all(checker))

         data.add("kouak", 3)
         expected.add_last("kouak")

         assert(data.count = expected.count)
         data.do_all(agent (item: STRING; key: INTEGER) is
                        do
                           label_assert(key.out, checker.item([item, key]))
                        end (?, ?))
      end

end