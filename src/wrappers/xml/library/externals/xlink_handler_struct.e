-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XLINK_HANDLER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

	xlink_handler_struct_set_simple (a_structure: POINTER; a_value: POINTER)
			-- Setter for simple field of XLINK_HANDLER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xlink_handler_struct_set_simple"
		}"
		end

	xlink_handler_struct_set_extended (a_structure: POINTER; a_value: POINTER)
			-- Setter for extended field of XLINK_HANDLER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xlink_handler_struct_set_extended"
		}"
		end

	xlink_handler_struct_set_set (a_structure: POINTER; a_value: POINTER)
			-- Setter for set field of XLINK_HANDLER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xlink_handler_struct_set_set"
		}"
		end

feature {} -- Low-level queries

	xlink_handler_struct_get_simple (a_structure: POINTER): POINTER
			-- Query for simple field of XLINK_HANDLER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xlink_handler_struct_get_simple"
		}"
		end

	xlink_handler_struct_get_extended (a_structure: POINTER): POINTER
			-- Query for extended field of XLINK_HANDLER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xlink_handler_struct_get_extended"
		}"
		end

	xlink_handler_struct_get_set (a_structure: POINTER): POINTER
			-- Query for set field of XLINK_HANDLER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xlink_handler_struct_get_set"
		}"
		end

feature -- Structure size
	struct_size: like size_t
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__xlinkHandler"
		}"
		end

end -- class XLINK_HANDLER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

