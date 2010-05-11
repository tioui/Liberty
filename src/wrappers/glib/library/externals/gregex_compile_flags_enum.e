-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GREGEX_COMPILE_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = caseless_low_level)  or else
				(a_value = dotall_low_level)  or else
				(a_value = extended_low_level)  or else
				(a_value = anchored_low_level)  or else
				(a_value = dollar__endonly_low_level)  or else
				(a_value = ungreedy_low_level)  or else
				(a_value = raw_low_level)  or else
				(a_value = no__auto__capture_low_level)  or else
				(a_value = optimize_low_level)  or else
				(a_value = dupnames_low_level)  or else
				(a_value = newline__cr_low_level)  or else
				(a_value = newline__lf_low_level)  or else
				(a_value = newline__crlf_low_level) )
		end

feature -- Setters
	default_create,
	set_caseless is
		do
			value := caseless_low_level
		end

	set_dotall is
		do
			value := dotall_low_level
		end

	set_extended is
		do
			value := extended_low_level
		end

	set_anchored is
		do
			value := anchored_low_level
		end

	set_dollar__endonly is
		do
			value := dollar__endonly_low_level
		end

	set_ungreedy is
		do
			value := ungreedy_low_level
		end

	set_raw is
		do
			value := raw_low_level
		end

	set_no__auto__capture is
		do
			value := no__auto__capture_low_level
		end

	set_optimize is
		do
			value := optimize_low_level
		end

	set_dupnames is
		do
			value := dupnames_low_level
		end

	set_newline__cr is
		do
			value := newline__cr_low_level
		end

	set_newline__lf is
		do
			value := newline__lf_low_level
		end

	set_newline__crlf is
		do
			value := newline__crlf_low_level
		end

feature -- Queries
	is_caseless: BOOLEAN is
		do
			Result := (value=caseless_low_level)
		end

	is_dotall: BOOLEAN is
		do
			Result := (value=dotall_low_level)
		end

	is_extended: BOOLEAN is
		do
			Result := (value=extended_low_level)
		end

	is_anchored: BOOLEAN is
		do
			Result := (value=anchored_low_level)
		end

	is_dollar__endonly: BOOLEAN is
		do
			Result := (value=dollar__endonly_low_level)
		end

	is_ungreedy: BOOLEAN is
		do
			Result := (value=ungreedy_low_level)
		end

	is_raw: BOOLEAN is
		do
			Result := (value=raw_low_level)
		end

	is_no__auto__capture: BOOLEAN is
		do
			Result := (value=no__auto__capture_low_level)
		end

	is_optimize: BOOLEAN is
		do
			Result := (value=optimize_low_level)
		end

	is_dupnames: BOOLEAN is
		do
			Result := (value=dupnames_low_level)
		end

	is_newline__cr: BOOLEAN is
		do
			Result := (value=newline__cr_low_level)
		end

	is_newline__lf: BOOLEAN is
		do
			Result := (value=newline__lf_low_level)
		end

	is_newline__crlf: BOOLEAN is
		do
			Result := (value=newline__crlf_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	caseless_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_CASELESS"
 			}"
 		end

	dotall_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_DOTALL"
 			}"
 		end

	extended_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_EXTENDED"
 			}"
 		end

	anchored_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ANCHORED"
 			}"
 		end

	dollar__endonly_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_DOLLAR_ENDONLY"
 			}"
 		end

	ungreedy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_UNGREEDY"
 			}"
 		end

	raw_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_RAW"
 			}"
 		end

	no__auto__capture_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_NO_AUTO_CAPTURE"
 			}"
 		end

	optimize_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_OPTIMIZE"
 			}"
 		end

	dupnames_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_DUPNAMES"
 			}"
 		end

	newline__cr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_NEWLINE_CR"
 			}"
 		end

	newline__lf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_NEWLINE_LF"
 			}"
 		end

	newline__crlf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_NEWLINE_CRLF"
 			}"
 		end


end -- class GREGEX_COMPILE_FLAGS_ENUM