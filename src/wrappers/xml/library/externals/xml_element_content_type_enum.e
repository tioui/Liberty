-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_ELEMENT_CONTENT_TYPE_ENUM

insert ENUM

create default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = xml_element_content_element_low_level)  or else
				(a_value = xml_element_content_or_low_level)  or else
				(a_value = xml_element_content_pcdata_low_level)  or else
				(a_value = xml_element_content_seq_low_level) )
		end

feature -- Setters
	default_create,
	set_xml_element_content_element
		do
			value := xml_element_content_element_low_level
		end

	set_xml_element_content_or
		do
			value := xml_element_content_or_low_level
		end

	set_xml_element_content_pcdata
		do
			value := xml_element_content_pcdata_low_level
		end

	set_xml_element_content_seq
		do
			value := xml_element_content_seq_low_level
		end

feature -- Queries
	is_xml_element_content_element: BOOLEAN
		do
			Result := (value=xml_element_content_element_low_level)
		end

	is_xml_element_content_or: BOOLEAN
		do
			Result := (value=xml_element_content_or_low_level)
		end

	is_xml_element_content_pcdata: BOOLEAN
		do
			Result := (value=xml_element_content_pcdata_low_level)
		end

	is_xml_element_content_seq: BOOLEAN
		do
			Result := (value=xml_element_content_seq_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_element_content_element_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_ELEMENT"
 			}"
 		end

	xml_element_content_or_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_OR"
 			}"
 		end

	xml_element_content_pcdata_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_PCDATA"
 			}"
 		end

	xml_element_content_seq_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_SEQ"
 			}"
 		end


end -- class XML_ELEMENT_CONTENT_TYPE_ENUM
