-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class FFI_RAW_CLOSURE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	FFI_TYPES
feature {} -- Low-level setters

	ffi_raw_closure_struct_set_tramp (a_structure: POINTER; a_value: POINTER) is
			-- Setter for tramp field of FFI_RAW_CLOSURE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_raw_closure_struct_set_tramp"
		}"
		end

	ffi_raw_closure_struct_set_cif (a_structure: POINTER; a_value: POINTER) is
			-- Setter for cif field of FFI_RAW_CLOSURE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_raw_closure_struct_set_cif"
		}"
		end

	ffi_raw_closure_struct_set_translate_args (a_structure: POINTER; a_value: POINTER) is
			-- Setter for translate_args field of FFI_RAW_CLOSURE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_raw_closure_struct_set_translate_args"
		}"
		end

	ffi_raw_closure_struct_set_this_closure (a_structure: POINTER; a_value: POINTER) is
			-- Setter for this_closure field of FFI_RAW_CLOSURE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_raw_closure_struct_set_this_closure"
		}"
		end

	ffi_raw_closure_struct_set_fun (a_structure: POINTER; a_value: POINTER) is
			-- Setter for fun field of FFI_RAW_CLOSURE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_raw_closure_struct_set_fun"
		}"
		end

	ffi_raw_closure_struct_set_user_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for user_data field of FFI_RAW_CLOSURE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_raw_closure_struct_set_user_data"
		}"
		end

feature {} -- Low-level queries

	ffi_raw_closure_struct_get_tramp (a_structure: POINTER): POINTER is
			-- Query for tramp field of FFI_RAW_CLOSURE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_raw_closure_struct_get_tramp"
		}"
		end

	ffi_raw_closure_struct_get_cif (a_structure: POINTER): POINTER is
			-- Query for cif field of FFI_RAW_CLOSURE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_raw_closure_struct_get_cif"
		}"
		end

	ffi_raw_closure_struct_get_translate_args (a_structure: POINTER): POINTER is
			-- Query for translate_args field of FFI_RAW_CLOSURE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_raw_closure_struct_get_translate_args"
		}"
		end

	ffi_raw_closure_struct_get_this_closure (a_structure: POINTER): POINTER is
			-- Query for this_closure field of FFI_RAW_CLOSURE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_raw_closure_struct_get_this_closure"
		}"
		end

	ffi_raw_closure_struct_get_fun (a_structure: POINTER): POINTER is
			-- Query for fun field of FFI_RAW_CLOSURE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_raw_closure_struct_get_fun"
		}"
		end

	ffi_raw_closure_struct_get_user_data (a_structure: POINTER): POINTER is
			-- Query for user_data field of FFI_RAW_CLOSURE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_raw_closure_struct_get_user_data"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_ffi_raw_closure"
		}"
		end

end -- class FFI_RAW_CLOSURE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

