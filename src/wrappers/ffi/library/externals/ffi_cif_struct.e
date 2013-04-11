-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class FFI_CIF_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	FFI_TYPES
feature {} -- Low-level setters

	ffi_cif_struct_set_abi (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for abi field of FFI_CIF_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_cif_struct_set_abi"
		}"
		end

	ffi_cif_struct_set_nargs (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for nargs field of FFI_CIF_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_cif_struct_set_nargs"
		}"
		end

	ffi_cif_struct_set_arg_types (a_structure: POINTER; a_value: POINTER) is
			-- Setter for arg_types field of FFI_CIF_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_cif_struct_set_arg_types"
		}"
		end

	ffi_cif_struct_set_rtype (a_structure: POINTER; a_value: POINTER) is
			-- Setter for rtype field of FFI_CIF_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_cif_struct_set_rtype"
		}"
		end

	ffi_cif_struct_set_bytes (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for bytes field of FFI_CIF_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_cif_struct_set_bytes"
		}"
		end

	ffi_cif_struct_set_flags (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for flags field of FFI_CIF_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_cif_struct_set_flags"
		}"
		end

feature {} -- Low-level queries

	ffi_cif_struct_get_abi (a_structure: POINTER): INTEGER is
			-- Query for abi field of FFI_CIF_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_cif_struct_get_abi"
		}"
		end

	ffi_cif_struct_get_nargs (a_structure: POINTER): NATURAL_32 is
			-- Query for nargs field of FFI_CIF_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_cif_struct_get_nargs"
		}"
		end

	ffi_cif_struct_get_arg_types (a_structure: POINTER): POINTER is
			-- Query for arg_types field of FFI_CIF_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_cif_struct_get_arg_types"
		}"
		end

	ffi_cif_struct_get_rtype (a_structure: POINTER): POINTER is
			-- Query for rtype field of FFI_CIF_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_cif_struct_get_rtype"
		}"
		end

	ffi_cif_struct_get_bytes (a_structure: POINTER): NATURAL_32 is
			-- Query for bytes field of FFI_CIF_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_cif_struct_get_bytes"
		}"
		end

	ffi_cif_struct_get_flags (a_structure: POINTER): NATURAL_32 is
			-- Query for flags field of FFI_CIF_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_cif_struct_get_flags"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_ffi_cif"
		}"
		end

end -- class FFI_CIF_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

