-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTABLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtktable_struct_set_children (a_structure: POINTER; a_value: POINTER) is
			-- Setter for children field of GTKTABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktable_struct_set_children"
		}"
		end

	gtktable_struct_set_rows (a_structure: POINTER; a_value: POINTER) is
			-- Setter for rows field of GTKTABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktable_struct_set_rows"
		}"
		end

	gtktable_struct_set_cols (a_structure: POINTER; a_value: POINTER) is
			-- Setter for cols field of GTKTABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktable_struct_set_cols"
		}"
		end

	gtktable_struct_set_nrows (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for nrows field of GTKTABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktable_struct_set_nrows"
		}"
		end

	gtktable_struct_set_ncols (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for ncols field of GTKTABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktable_struct_set_ncols"
		}"
		end

	gtktable_struct_set_column_spacing (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for column_spacing field of GTKTABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktable_struct_set_column_spacing"
		}"
		end

	gtktable_struct_set_row_spacing (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for row_spacing field of GTKTABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktable_struct_set_row_spacing"
		}"
		end

	gtktable_struct_set_homogeneous (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for homogeneous field of GTKTABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktable_struct_set_homogeneous"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field container.
	gtktable_struct_get_children (a_structure: POINTER): POINTER is
			-- Query for children field of GTKTABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktable_struct_get_children"
		}"
		end

	gtktable_struct_get_rows (a_structure: POINTER): POINTER is
			-- Query for rows field of GTKTABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktable_struct_get_rows"
		}"
		end

	gtktable_struct_get_cols (a_structure: POINTER): POINTER is
			-- Query for cols field of GTKTABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktable_struct_get_cols"
		}"
		end

	gtktable_struct_get_nrows (a_structure: POINTER): NATURAL_16 is
			-- Query for nrows field of GTKTABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktable_struct_get_nrows"
		}"
		end

	gtktable_struct_get_ncols (a_structure: POINTER): NATURAL_16 is
			-- Query for ncols field of GTKTABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktable_struct_get_ncols"
		}"
		end

	gtktable_struct_get_column_spacing (a_structure: POINTER): NATURAL_16 is
			-- Query for column_spacing field of GTKTABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktable_struct_get_column_spacing"
		}"
		end

	gtktable_struct_get_row_spacing (a_structure: POINTER): NATURAL_16 is
			-- Query for row_spacing field of GTKTABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktable_struct_get_row_spacing"
		}"
		end

	gtktable_struct_get_homogeneous (a_structure: POINTER): NATURAL_32 is
			-- Query for homogeneous field of GTKTABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktable_struct_get_homogeneous"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTable"
		}"
		end

end -- class GTKTABLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

