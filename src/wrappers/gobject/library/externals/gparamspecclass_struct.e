-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPARAMSPECCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gparamspecclass_struct_set_value_type (a_structure: POINTER; a_value: NATURAL_64) is
			-- Setter for value_type field of GPARAMSPECCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecclass_struct_set_value_type"
		}"
		end

	gparamspecclass_struct_set_finalize (a_structure: POINTER; a_value: POINTER) is
			-- Setter for finalize field of GPARAMSPECCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecclass_struct_set_finalize"
		}"
		end

	gparamspecclass_struct_set_value_set_default (a_structure: POINTER; a_value: POINTER) is
			-- Setter for value_set_default field of GPARAMSPECCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecclass_struct_set_value_set_default"
		}"
		end

	gparamspecclass_struct_set_value_validate (a_structure: POINTER; a_value: POINTER) is
			-- Setter for value_validate field of GPARAMSPECCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecclass_struct_set_value_validate"
		}"
		end

	gparamspecclass_struct_set_values_cmp (a_structure: POINTER; a_value: POINTER) is
			-- Setter for values_cmp field of GPARAMSPECCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecclass_struct_set_values_cmp"
		}"
		end

	gparamspecclass_struct_set_dummy (a_structure: POINTER; a_value: POINTER) is
			-- Setter for dummy field of GPARAMSPECCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecclass_struct_set_dummy"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field g_type_class.
	gparamspecclass_struct_get_value_type (a_structure: POINTER): NATURAL_64 is
			-- Query for value_type field of GPARAMSPECCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecclass_struct_get_value_type"
		}"
		end

	gparamspecclass_struct_get_finalize (a_structure: POINTER): POINTER is
			-- Query for finalize field of GPARAMSPECCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecclass_struct_get_finalize"
		}"
		end

	gparamspecclass_struct_get_value_set_default (a_structure: POINTER): POINTER is
			-- Query for value_set_default field of GPARAMSPECCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecclass_struct_get_value_set_default"
		}"
		end

	gparamspecclass_struct_get_value_validate (a_structure: POINTER): POINTER is
			-- Query for value_validate field of GPARAMSPECCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecclass_struct_get_value_validate"
		}"
		end

	gparamspecclass_struct_get_values_cmp (a_structure: POINTER): POINTER is
			-- Query for values_cmp field of GPARAMSPECCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecclass_struct_get_values_cmp"
		}"
		end

	gparamspecclass_struct_get_dummy (a_structure: POINTER): POINTER is
			-- Query for dummy field of GPARAMSPECCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecclass_struct_get_dummy"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GParamSpecClass"
		}"
		end

end -- class GPARAMSPECCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

