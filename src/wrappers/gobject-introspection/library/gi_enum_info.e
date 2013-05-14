class GI_ENUM_INFO
	-- A GObject Introspection metadata representing an enumeration and its values
   
	-- A GI_ENUM_INFO represents an enumeration and a GI_VALUE_INFO struct
	-- represents a value of an enumeration. The GIEnumInfo contains a set of
	-- values and a type The GIValueInfo is fetched by calling
	-- g_enum_info_get_value() on a GIEnumInfo.

inherit
	GI_REGISTERED_TYPE_INFO
	INDEXABLE[GI_VALUE_INFO]

insert
	GIENUMINFO_EXTERNALS

creation from_external_pointer

feature
	lower: INTEGER is 0
	upper: INTEGER is 
		do
			Result:=count-1
		end

	count: INTEGER is
		-- the number of values this enumeration contains.
	do
		Result := g_enum_info_get_n_values(handle)
	end 

	item (i: INTEGER): GI_VALUE_INFO is
	do
		create Result(g_enum_info_get_value(handle,i))
		-- g_enum_info_get_value returns the enumeration value or NULL if type tag is wrong but it would not since the precondition prevent this.
	ensure not_void: Result/=Void
	end

	-- TODO: it puzzles me how an enumeration could have methods. I will clarify this as soon as I understand the meaning of this

	methods_count: INTEGER is
		-- the number of methods that this enum type has.
	do
		Result := g_enum_info_get_n_methods(handle)
	end

	method_at (i: INTEGER): GI_FUNCTION_INFO is
		-- The enum type method at index `i'
	require valid_index: i.in_range(0,methods_count-1)
	do
		create Result.from_external_pointer(g_enum_info_get_method(handle,i))
   		-- g_enum_info_get_method Returns : the GIFunctionInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
   ensure Result/=Void
	end

	storage_type: GITYPE_TAG_ENUM is
		-- the tag of the type used for the enum in the C ABI. This will will be a signed or unsigned integral type.

		-- Note that in the current implementation the width of the type is
		-- computed correctly, but the signed or unsigned nature of the type
		-- may not match the sign of the type used by the C compiler.
	do
		Result.set(g_enum_info_get_storage_type(handle))
	end
end
