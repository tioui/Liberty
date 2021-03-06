-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_EXP_NODE_TYPE_ENUM

insert ENUM

create default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = xml_exp_atom_low_level)  or else
				(a_value = xml_exp_count_low_level)  or else
				(a_value = xml_exp_empty_low_level)  or else
				(a_value = xml_exp_forbid_low_level)  or else
				(a_value = xml_exp_or_low_level)  or else
				(a_value = xml_exp_seq_low_level) )
		end

feature -- Setters
	default_create,
	set_xml_exp_atom
		do
			value := xml_exp_atom_low_level
		end

	set_xml_exp_count
		do
			value := xml_exp_count_low_level
		end

	set_xml_exp_empty
		do
			value := xml_exp_empty_low_level
		end

	set_xml_exp_forbid
		do
			value := xml_exp_forbid_low_level
		end

	set_xml_exp_or
		do
			value := xml_exp_or_low_level
		end

	set_xml_exp_seq
		do
			value := xml_exp_seq_low_level
		end

feature -- Queries
	is_xml_exp_atom: BOOLEAN
		do
			Result := (value=xml_exp_atom_low_level)
		end

	is_xml_exp_count: BOOLEAN
		do
			Result := (value=xml_exp_count_low_level)
		end

	is_xml_exp_empty: BOOLEAN
		do
			Result := (value=xml_exp_empty_low_level)
		end

	is_xml_exp_forbid: BOOLEAN
		do
			Result := (value=xml_exp_forbid_low_level)
		end

	is_xml_exp_or: BOOLEAN
		do
			Result := (value=xml_exp_or_low_level)
		end

	is_xml_exp_seq: BOOLEAN
		do
			Result := (value=xml_exp_seq_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_exp_atom_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_EXP_ATOM"
 			}"
 		end

	xml_exp_count_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_EXP_COUNT"
 			}"
 		end

	xml_exp_empty_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_EXP_EMPTY"
 			}"
 		end

	xml_exp_forbid_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_EXP_FORBID"
 			}"
 		end

	xml_exp_or_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_EXP_OR"
 			}"
 		end

	xml_exp_seq_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_EXP_SEQ"
 			}"
 		end


end -- class XML_EXP_NODE_TYPE_ENUM
