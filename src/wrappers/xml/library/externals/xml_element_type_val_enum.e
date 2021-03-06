-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_ELEMENT_TYPE_VAL_ENUM

insert ENUM

create default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = xml_element_type_any_low_level)  or else
				(a_value = xml_element_type_element_low_level)  or else
				(a_value = xml_element_type_empty_low_level)  or else
				(a_value = xml_element_type_mixed_low_level)  or else
				(a_value = xml_element_type_undefined_low_level) )
		end

feature -- Setters
	default_create,
	set_xml_element_type_any
		do
			value := xml_element_type_any_low_level
		end

	set_xml_element_type_element
		do
			value := xml_element_type_element_low_level
		end

	set_xml_element_type_empty
		do
			value := xml_element_type_empty_low_level
		end

	set_xml_element_type_mixed
		do
			value := xml_element_type_mixed_low_level
		end

	set_xml_element_type_undefined
		do
			value := xml_element_type_undefined_low_level
		end

feature -- Queries
	is_xml_element_type_any: BOOLEAN
		do
			Result := (value=xml_element_type_any_low_level)
		end

	is_xml_element_type_element: BOOLEAN
		do
			Result := (value=xml_element_type_element_low_level)
		end

	is_xml_element_type_empty: BOOLEAN
		do
			Result := (value=xml_element_type_empty_low_level)
		end

	is_xml_element_type_mixed: BOOLEAN
		do
			Result := (value=xml_element_type_mixed_low_level)
		end

	is_xml_element_type_undefined: BOOLEAN
		do
			Result := (value=xml_element_type_undefined_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_element_type_any_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_TYPE_ANY"
 			}"
 		end

	xml_element_type_element_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_TYPE_ELEMENT"
 			}"
 		end

	xml_element_type_empty_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_TYPE_EMPTY"
 			}"
 		end

	xml_element_type_mixed_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_TYPE_MIXED"
 			}"
 		end

	xml_element_type_undefined_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_TYPE_UNDEFINED"
 			}"
 		end


end -- class XML_ELEMENT_TYPE_VAL_ENUM
