-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSTOCK_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_stock_item_copy (an_item: POINTER): POINTER is
 		-- gtk_stock_item_copy (node at line 10132)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_stock_item_copy"
		}"
		end

	gtk_stock_add (an_items: POINTER; a_n_items: NATURAL_32) is
 		-- gtk_stock_add (node at line 13240)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_stock_add"
		}"
		end

	gtk_stock_set_translate_func (a_domain: POINTER; a_func: POINTER; a_data: POINTER; a_notify: POINTER) is
 		-- gtk_stock_set_translate_func (node at line 15174)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_stock_set_translate_func"
		}"
		end

	gtk_stock_lookup (a_stock_id: POINTER; an_item: POINTER): INTEGER_32 is
 		-- gtk_stock_lookup (node at line 17257)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_stock_lookup"
		}"
		end

	gtk_stock_item_free (an_item: POINTER) is
 		-- gtk_stock_item_free (node at line 28549)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_stock_item_free"
		}"
		end

	gtk_stock_list_ids: POINTER is
 		-- gtk_stock_list_ids (node at line 34110)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_stock_list_ids()"
		}"
		end

	gtk_stock_add_static (an_items: POINTER; a_n_items: NATURAL_32) is
 		-- gtk_stock_add_static (node at line 36020)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_stock_add_static"
		}"
		end


end -- class GTKSTOCK_EXTERNALS