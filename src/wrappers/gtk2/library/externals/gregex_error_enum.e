-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GREGEX_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = compile_low_level)  or else
				(a_value = optimize_low_level)  or else
				(a_value = replace_low_level)  or else
				(a_value = match_low_level)  or else
				(a_value = internal_low_level)  or else
				(a_value = stray_backslash_low_level)  or else
				(a_value = missing_control_char_low_level)  or else
				(a_value = unrecognized_escape_low_level)  or else
				(a_value = quantifiers_out_of_order_low_level)  or else
				(a_value = quantifier_too_big_low_level)  or else
				(a_value = unterminated_character_class_low_level)  or else
				(a_value = invalid_escape_in_character_class_low_level)  or else
				(a_value = range_out_of_order_low_level)  or else
				(a_value = nothing_to_repeat_low_level)  or else
				(a_value = unrecognized_character_low_level)  or else
				(a_value = posix_named_class_outside_class_low_level)  or else
				(a_value = unmatched_parenthesis_low_level)  or else
				(a_value = inexistent_subpattern_reference_low_level)  or else
				(a_value = unterminated_comment_low_level)  or else
				(a_value = expression_too_large_low_level)  or else
				(a_value = memory_error_low_level)  or else
				(a_value = variable_length_lookbehind_low_level)  or else
				(a_value = malformed_condition_low_level)  or else
				(a_value = too_many_conditional_branches_low_level)  or else
				(a_value = assertion_expected_low_level)  or else
				(a_value = unknown_posix_class_name_low_level)  or else
				(a_value = posix_collating_elements_not_supported_low_level)  or else
				(a_value = hex_code_too_large_low_level)  or else
				(a_value = invalid_condition_low_level)  or else
				(a_value = single_byte_match_in_lookbehind_low_level)  or else
				(a_value = infinite_loop_low_level)  or else
				(a_value = missing_subpattern_name_terminator_low_level)  or else
				(a_value = duplicate_subpattern_name_low_level)  or else
				(a_value = malformed_property_low_level)  or else
				(a_value = unknown_property_low_level)  or else
				(a_value = subpattern_name_too_long_low_level)  or else
				(a_value = too_many_subpatterns_low_level)  or else
				(a_value = invalid_octal_value_low_level)  or else
				(a_value = too_many_branches_in_define_low_level)  or else
				(a_value = define_repetion_low_level)  or else
				(a_value = inconsistent_newline_options_low_level)  or else
				(a_value = missing_back_reference_low_level)  or else
				(a_value = invalid_relative_reference_low_level)  or else
				(a_value = backtracking_control_verb_argument_forbidden_low_level)  or else
				(a_value = unknown_backtracking_control_verb_low_level)  or else
				(a_value = number_too_big_low_level)  or else
				(a_value = missing_subpattern_name_low_level)  or else
				(a_value = missing_digit_low_level)  or else
				(a_value = invalid_data_character_low_level)  or else
				(a_value = extra_subpattern_name_low_level)  or else
				(a_value = backtracking_control_verb_argument_required_low_level)  or else
				(a_value = invalid_control_char_low_level)  or else
				(a_value = missing_name_low_level)  or else
				(a_value = not_supported_in_class_low_level)  or else
				(a_value = too_many_forward_references_low_level)  or else
				(a_value = name_too_long_low_level)  or else
				(a_value = character_value_too_large_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_compile is
		do
			value := compile_low_level
		end

	set_optimize is
		do
			value := optimize_low_level
		end

	set_replace is
		do
			value := replace_low_level
		end

	set_match is
		do
			value := match_low_level
		end

	set_internal is
		do
			value := internal_low_level
		end

	set_stray_backslash is
		do
			value := stray_backslash_low_level
		end

	set_missing_control_char is
		do
			value := missing_control_char_low_level
		end

	set_unrecognized_escape is
		do
			value := unrecognized_escape_low_level
		end

	set_quantifiers_out_of_order is
		do
			value := quantifiers_out_of_order_low_level
		end

	set_quantifier_too_big is
		do
			value := quantifier_too_big_low_level
		end

	set_unterminated_character_class is
		do
			value := unterminated_character_class_low_level
		end

	set_invalid_escape_in_character_class is
		do
			value := invalid_escape_in_character_class_low_level
		end

	set_range_out_of_order is
		do
			value := range_out_of_order_low_level
		end

	set_nothing_to_repeat is
		do
			value := nothing_to_repeat_low_level
		end

	set_unrecognized_character is
		do
			value := unrecognized_character_low_level
		end

	set_posix_named_class_outside_class is
		do
			value := posix_named_class_outside_class_low_level
		end

	set_unmatched_parenthesis is
		do
			value := unmatched_parenthesis_low_level
		end

	set_inexistent_subpattern_reference is
		do
			value := inexistent_subpattern_reference_low_level
		end

	set_unterminated_comment is
		do
			value := unterminated_comment_low_level
		end

	set_expression_too_large is
		do
			value := expression_too_large_low_level
		end

	set_memory_error is
		do
			value := memory_error_low_level
		end

	set_variable_length_lookbehind is
		do
			value := variable_length_lookbehind_low_level
		end

	set_malformed_condition is
		do
			value := malformed_condition_low_level
		end

	set_too_many_conditional_branches is
		do
			value := too_many_conditional_branches_low_level
		end

	set_assertion_expected is
		do
			value := assertion_expected_low_level
		end

	set_unknown_posix_class_name is
		do
			value := unknown_posix_class_name_low_level
		end

	set_posix_collating_elements_not_supported is
		do
			value := posix_collating_elements_not_supported_low_level
		end

	set_hex_code_too_large is
		do
			value := hex_code_too_large_low_level
		end

	set_invalid_condition is
		do
			value := invalid_condition_low_level
		end

	set_single_byte_match_in_lookbehind is
		do
			value := single_byte_match_in_lookbehind_low_level
		end

	set_infinite_loop is
		do
			value := infinite_loop_low_level
		end

	set_missing_subpattern_name_terminator is
		do
			value := missing_subpattern_name_terminator_low_level
		end

	set_duplicate_subpattern_name is
		do
			value := duplicate_subpattern_name_low_level
		end

	set_malformed_property is
		do
			value := malformed_property_low_level
		end

	set_unknown_property is
		do
			value := unknown_property_low_level
		end

	set_subpattern_name_too_long is
		do
			value := subpattern_name_too_long_low_level
		end

	set_too_many_subpatterns is
		do
			value := too_many_subpatterns_low_level
		end

	set_invalid_octal_value is
		do
			value := invalid_octal_value_low_level
		end

	set_too_many_branches_in_define is
		do
			value := too_many_branches_in_define_low_level
		end

	set_define_repetion is
		do
			value := define_repetion_low_level
		end

	set_inconsistent_newline_options is
		do
			value := inconsistent_newline_options_low_level
		end

	set_missing_back_reference is
		do
			value := missing_back_reference_low_level
		end

	set_invalid_relative_reference is
		do
			value := invalid_relative_reference_low_level
		end

	set_backtracking_control_verb_argument_forbidden is
		do
			value := backtracking_control_verb_argument_forbidden_low_level
		end

	set_unknown_backtracking_control_verb is
		do
			value := unknown_backtracking_control_verb_low_level
		end

	set_number_too_big is
		do
			value := number_too_big_low_level
		end

	set_missing_subpattern_name is
		do
			value := missing_subpattern_name_low_level
		end

	set_missing_digit is
		do
			value := missing_digit_low_level
		end

	set_invalid_data_character is
		do
			value := invalid_data_character_low_level
		end

	set_extra_subpattern_name is
		do
			value := extra_subpattern_name_low_level
		end

	set_backtracking_control_verb_argument_required is
		do
			value := backtracking_control_verb_argument_required_low_level
		end

	set_invalid_control_char is
		do
			value := invalid_control_char_low_level
		end

	set_missing_name is
		do
			value := missing_name_low_level
		end

	set_not_supported_in_class is
		do
			value := not_supported_in_class_low_level
		end

	set_too_many_forward_references is
		do
			value := too_many_forward_references_low_level
		end

	set_name_too_long is
		do
			value := name_too_long_low_level
		end

	set_character_value_too_large is
		do
			value := character_value_too_large_low_level
		end

feature {ANY} -- Queries
	compile: BOOLEAN is
		do
			Result := (value=compile_low_level)
		end

	optimize: BOOLEAN is
		do
			Result := (value=optimize_low_level)
		end

	replace: BOOLEAN is
		do
			Result := (value=replace_low_level)
		end

	match: BOOLEAN is
		do
			Result := (value=match_low_level)
		end

	internal: BOOLEAN is
		do
			Result := (value=internal_low_level)
		end

	stray_backslash: BOOLEAN is
		do
			Result := (value=stray_backslash_low_level)
		end

	missing_control_char: BOOLEAN is
		do
			Result := (value=missing_control_char_low_level)
		end

	unrecognized_escape: BOOLEAN is
		do
			Result := (value=unrecognized_escape_low_level)
		end

	quantifiers_out_of_order: BOOLEAN is
		do
			Result := (value=quantifiers_out_of_order_low_level)
		end

	quantifier_too_big: BOOLEAN is
		do
			Result := (value=quantifier_too_big_low_level)
		end

	unterminated_character_class: BOOLEAN is
		do
			Result := (value=unterminated_character_class_low_level)
		end

	invalid_escape_in_character_class: BOOLEAN is
		do
			Result := (value=invalid_escape_in_character_class_low_level)
		end

	range_out_of_order: BOOLEAN is
		do
			Result := (value=range_out_of_order_low_level)
		end

	nothing_to_repeat: BOOLEAN is
		do
			Result := (value=nothing_to_repeat_low_level)
		end

	unrecognized_character: BOOLEAN is
		do
			Result := (value=unrecognized_character_low_level)
		end

	posix_named_class_outside_class: BOOLEAN is
		do
			Result := (value=posix_named_class_outside_class_low_level)
		end

	unmatched_parenthesis: BOOLEAN is
		do
			Result := (value=unmatched_parenthesis_low_level)
		end

	inexistent_subpattern_reference: BOOLEAN is
		do
			Result := (value=inexistent_subpattern_reference_low_level)
		end

	unterminated_comment: BOOLEAN is
		do
			Result := (value=unterminated_comment_low_level)
		end

	expression_too_large: BOOLEAN is
		do
			Result := (value=expression_too_large_low_level)
		end

	memory_error: BOOLEAN is
		do
			Result := (value=memory_error_low_level)
		end

	variable_length_lookbehind: BOOLEAN is
		do
			Result := (value=variable_length_lookbehind_low_level)
		end

	malformed_condition: BOOLEAN is
		do
			Result := (value=malformed_condition_low_level)
		end

	too_many_conditional_branches: BOOLEAN is
		do
			Result := (value=too_many_conditional_branches_low_level)
		end

	assertion_expected: BOOLEAN is
		do
			Result := (value=assertion_expected_low_level)
		end

	unknown_posix_class_name: BOOLEAN is
		do
			Result := (value=unknown_posix_class_name_low_level)
		end

	posix_collating_elements_not_supported: BOOLEAN is
		do
			Result := (value=posix_collating_elements_not_supported_low_level)
		end

	hex_code_too_large: BOOLEAN is
		do
			Result := (value=hex_code_too_large_low_level)
		end

	invalid_condition: BOOLEAN is
		do
			Result := (value=invalid_condition_low_level)
		end

	single_byte_match_in_lookbehind: BOOLEAN is
		do
			Result := (value=single_byte_match_in_lookbehind_low_level)
		end

	infinite_loop: BOOLEAN is
		do
			Result := (value=infinite_loop_low_level)
		end

	missing_subpattern_name_terminator: BOOLEAN is
		do
			Result := (value=missing_subpattern_name_terminator_low_level)
		end

	duplicate_subpattern_name: BOOLEAN is
		do
			Result := (value=duplicate_subpattern_name_low_level)
		end

	malformed_property: BOOLEAN is
		do
			Result := (value=malformed_property_low_level)
		end

	unknown_property: BOOLEAN is
		do
			Result := (value=unknown_property_low_level)
		end

	subpattern_name_too_long: BOOLEAN is
		do
			Result := (value=subpattern_name_too_long_low_level)
		end

	too_many_subpatterns: BOOLEAN is
		do
			Result := (value=too_many_subpatterns_low_level)
		end

	invalid_octal_value: BOOLEAN is
		do
			Result := (value=invalid_octal_value_low_level)
		end

	too_many_branches_in_define: BOOLEAN is
		do
			Result := (value=too_many_branches_in_define_low_level)
		end

	define_repetion: BOOLEAN is
		do
			Result := (value=define_repetion_low_level)
		end

	inconsistent_newline_options: BOOLEAN is
		do
			Result := (value=inconsistent_newline_options_low_level)
		end

	missing_back_reference: BOOLEAN is
		do
			Result := (value=missing_back_reference_low_level)
		end

	invalid_relative_reference: BOOLEAN is
		do
			Result := (value=invalid_relative_reference_low_level)
		end

	backtracking_control_verb_argument_forbidden: BOOLEAN is
		do
			Result := (value=backtracking_control_verb_argument_forbidden_low_level)
		end

	unknown_backtracking_control_verb: BOOLEAN is
		do
			Result := (value=unknown_backtracking_control_verb_low_level)
		end

	number_too_big: BOOLEAN is
		do
			Result := (value=number_too_big_low_level)
		end

	missing_subpattern_name: BOOLEAN is
		do
			Result := (value=missing_subpattern_name_low_level)
		end

	missing_digit: BOOLEAN is
		do
			Result := (value=missing_digit_low_level)
		end

	invalid_data_character: BOOLEAN is
		do
			Result := (value=invalid_data_character_low_level)
		end

	extra_subpattern_name: BOOLEAN is
		do
			Result := (value=extra_subpattern_name_low_level)
		end

	backtracking_control_verb_argument_required: BOOLEAN is
		do
			Result := (value=backtracking_control_verb_argument_required_low_level)
		end

	invalid_control_char: BOOLEAN is
		do
			Result := (value=invalid_control_char_low_level)
		end

	missing_name: BOOLEAN is
		do
			Result := (value=missing_name_low_level)
		end

	not_supported_in_class: BOOLEAN is
		do
			Result := (value=not_supported_in_class_low_level)
		end

	too_many_forward_references: BOOLEAN is
		do
			Result := (value=too_many_forward_references_low_level)
		end

	name_too_long: BOOLEAN is
		do
			Result := (value=name_too_long_low_level)
		end

	character_value_too_large: BOOLEAN is
		do
			Result := (value=character_value_too_large_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	compile_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_COMPILE"
 			}"
 		end

	optimize_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_OPTIMIZE"
 			}"
 		end

	replace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_REPLACE"
 			}"
 		end

	match_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MATCH"
 			}"
 		end

	internal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INTERNAL"
 			}"
 		end

	stray_backslash_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_STRAY_BACKSLASH"
 			}"
 		end

	missing_control_char_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MISSING_CONTROL_CHAR"
 			}"
 		end

	unrecognized_escape_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNRECOGNIZED_ESCAPE"
 			}"
 		end

	quantifiers_out_of_order_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_QUANTIFIERS_OUT_OF_ORDER"
 			}"
 		end

	quantifier_too_big_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_QUANTIFIER_TOO_BIG"
 			}"
 		end

	unterminated_character_class_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNTERMINATED_CHARACTER_CLASS"
 			}"
 		end

	invalid_escape_in_character_class_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INVALID_ESCAPE_IN_CHARACTER_CLASS"
 			}"
 		end

	range_out_of_order_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_RANGE_OUT_OF_ORDER"
 			}"
 		end

	nothing_to_repeat_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_NOTHING_TO_REPEAT"
 			}"
 		end

	unrecognized_character_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNRECOGNIZED_CHARACTER"
 			}"
 		end

	posix_named_class_outside_class_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_POSIX_NAMED_CLASS_OUTSIDE_CLASS"
 			}"
 		end

	unmatched_parenthesis_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNMATCHED_PARENTHESIS"
 			}"
 		end

	inexistent_subpattern_reference_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INEXISTENT_SUBPATTERN_REFERENCE"
 			}"
 		end

	unterminated_comment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNTERMINATED_COMMENT"
 			}"
 		end

	expression_too_large_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_EXPRESSION_TOO_LARGE"
 			}"
 		end

	memory_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MEMORY_ERROR"
 			}"
 		end

	variable_length_lookbehind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_VARIABLE_LENGTH_LOOKBEHIND"
 			}"
 		end

	malformed_condition_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MALFORMED_CONDITION"
 			}"
 		end

	too_many_conditional_branches_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_TOO_MANY_CONDITIONAL_BRANCHES"
 			}"
 		end

	assertion_expected_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_ASSERTION_EXPECTED"
 			}"
 		end

	unknown_posix_class_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNKNOWN_POSIX_CLASS_NAME"
 			}"
 		end

	posix_collating_elements_not_supported_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_POSIX_COLLATING_ELEMENTS_NOT_SUPPORTED"
 			}"
 		end

	hex_code_too_large_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_HEX_CODE_TOO_LARGE"
 			}"
 		end

	invalid_condition_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INVALID_CONDITION"
 			}"
 		end

	single_byte_match_in_lookbehind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_SINGLE_BYTE_MATCH_IN_LOOKBEHIND"
 			}"
 		end

	infinite_loop_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INFINITE_LOOP"
 			}"
 		end

	missing_subpattern_name_terminator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MISSING_SUBPATTERN_NAME_TERMINATOR"
 			}"
 		end

	duplicate_subpattern_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_DUPLICATE_SUBPATTERN_NAME"
 			}"
 		end

	malformed_property_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MALFORMED_PROPERTY"
 			}"
 		end

	unknown_property_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNKNOWN_PROPERTY"
 			}"
 		end

	subpattern_name_too_long_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_SUBPATTERN_NAME_TOO_LONG"
 			}"
 		end

	too_many_subpatterns_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_TOO_MANY_SUBPATTERNS"
 			}"
 		end

	invalid_octal_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INVALID_OCTAL_VALUE"
 			}"
 		end

	too_many_branches_in_define_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_TOO_MANY_BRANCHES_IN_DEFINE"
 			}"
 		end

	define_repetion_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_DEFINE_REPETION"
 			}"
 		end

	inconsistent_newline_options_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INCONSISTENT_NEWLINE_OPTIONS"
 			}"
 		end

	missing_back_reference_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MISSING_BACK_REFERENCE"
 			}"
 		end

	invalid_relative_reference_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INVALID_RELATIVE_REFERENCE"
 			}"
 		end

	backtracking_control_verb_argument_forbidden_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_BACKTRACKING_CONTROL_VERB_ARGUMENT_FORBIDDEN"
 			}"
 		end

	unknown_backtracking_control_verb_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNKNOWN_BACKTRACKING_CONTROL_VERB"
 			}"
 		end

	number_too_big_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_NUMBER_TOO_BIG"
 			}"
 		end

	missing_subpattern_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MISSING_SUBPATTERN_NAME"
 			}"
 		end

	missing_digit_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MISSING_DIGIT"
 			}"
 		end

	invalid_data_character_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INVALID_DATA_CHARACTER"
 			}"
 		end

	extra_subpattern_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_EXTRA_SUBPATTERN_NAME"
 			}"
 		end

	backtracking_control_verb_argument_required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_BACKTRACKING_CONTROL_VERB_ARGUMENT_REQUIRED"
 			}"
 		end

	invalid_control_char_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INVALID_CONTROL_CHAR"
 			}"
 		end

	missing_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MISSING_NAME"
 			}"
 		end

	not_supported_in_class_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_NOT_SUPPORTED_IN_CLASS"
 			}"
 		end

	too_many_forward_references_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_TOO_MANY_FORWARD_REFERENCES"
 			}"
 		end

	name_too_long_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_NAME_TOO_LONG"
 			}"
 		end

	character_value_too_large_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_CHARACTER_VALUE_TOO_LARGE"
 			}"
 		end


end -- class GREGEX_ERROR_ENUM
