-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XML_EXP_CTXT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
	-- Fieldless structure
feature -- Structure size
	struct_size: like size_t
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__xmlExpCtxt"
		}"
		end

end -- class XML_EXP_CTXT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

