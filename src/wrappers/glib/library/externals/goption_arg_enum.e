-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GOPTION_ARG_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = int_low_level)  or else
				(a_value = callback_low_level)  or else
				(a_value = filename_low_level)  or else
				(a_value = string__array_low_level)  or else
				(a_value = filename__array_low_level)  or else
				(a_value = double_low_level)  or else
				(a_value = int_64_low_level) )
		end

feature -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_int is
		do
			value := int_low_level
		end

	set_callback is
		do
			value := callback_low_level
		end

	set_filename is
		do
			value := filename_low_level
		end

	set_string__array is
		do
			value := string__array_low_level
		end

	set_filename__array is
		do
			value := filename__array_low_level
		end

	set_double is
		do
			value := double_low_level
		end

	set_int_64 is
		do
			value := int_64_low_level
		end

feature -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	is_int: BOOLEAN is
		do
			Result := (value=int_low_level)
		end

	is_callback: BOOLEAN is
		do
			Result := (value=callback_low_level)
		end

	is_filename: BOOLEAN is
		do
			Result := (value=filename_low_level)
		end

	is_string__array: BOOLEAN is
		do
			Result := (value=string__array_low_level)
		end

	is_filename__array: BOOLEAN is
		do
			Result := (value=filename__array_low_level)
		end

	is_double: BOOLEAN is
		do
			Result := (value=double_low_level)
		end

	is_int_64: BOOLEAN is
		do
			Result := (value=int_64_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_NONE"
 			}"
 		end

	int_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_INT"
 			}"
 		end

	callback_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_CALLBACK"
 			}"
 		end

	filename_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_FILENAME"
 			}"
 		end

	string__array_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_STRING_ARRAY"
 			}"
 		end

	filename__array_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_FILENAME_ARRAY"
 			}"
 		end

	double_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_DOUBLE"
 			}"
 		end

	int_64_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_INT64"
 			}"
 		end


end -- class GOPTION_ARG_ENUM