indexing
	description: "The GList provides a standard singly-linked list data structure."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

			-- Note that most of the GList functions expect to be passed
			-- a pointer to the first element in the list. The functions
			-- which insert elements return the new start of the list,
			-- which may have changed.

			-- There is no function to create a GList. NULL is
			-- considered to be the empty list so you simply set a
			-- GList* to NULL.

			-- To add elements, use g_slist_append(), g_slist_prepend(),
			-- g_slist_insert() and g_slist_insert_sorted().

			-- To remove elements, use g_list_remove().

			-- To find elements in the list use g_list_last(),
			-- g_list_next(), g_list_nth(), g_list_nth_data(),
			-- g_list_find() and g_list_find_custom().

			-- To find the index of an element use g_list_position() and
			-- g_list_index().

			-- To call a function for each element in the list use
			-- g_list_foreach().

			-- To free the entire list, use g_list_free().

class G_LIST [ITEM->WRAPPER]
inherit
-- TODO: uncomment this when possible:
-- Temporary commented out to let some example work with SnartEiffel 
-- version 2.2 and SVN
-- 	LINKED_COLLECTION [ITEM]
-- 		redefine
-- 			append_collection,
-- 			clear_all,
-- 			has,
-- 			fast_has,
-- 			fast_first_index_of,
-- 			first_index_of,
-- 			get_new_iterator,
-- 			reverse,
-- 			upper,
-- 			swap
-- 		end
	SHARED_C_STRUCT
		rename exists as wrapped_object_exists
		undefine fill_tagged_out_memory, copy
		-- unnecessary redifining: it's already deferred: redefine make
		end
	-- Note: Shall the wrapper factory be inserted rather than 
	-- inherited?
	WRAPPER_FACTORY [ITEM]	
	
insert
	G_LIST_EXTERNALS undefine copy,is_equal,fill_tagged_out_memory end
	
creation make, from_external_pointer

feature
	make is
		do
			handle := Null
		end

	first: ITEM is
		require not empty
		do
			Result := new_item
			Result.from_external_pointer (g_list_get_data (handle))
		ensure Result/=Void
		end

	last: like first is 
		require not empty
		do
			Result := new_item
			Result.from_external_pointer (g_list_get_data (g_list_last (handle)))
		end

	item (i: INTEGER): like first is
		require not empty
		do
			Result := new_item
			Result.from_external_pointer (g_list_nth_data (handle, i))
		end

	put (an_item: like first; i: INTEGER) is
		require else valid_item: an_item/=Void 
		do
			g_list_set_data (g_list_nth(handle,i), an_item.handle)
		end

	swap (i,j: INTEGER) is
		local ith,jth,tmp: POINTER
		do
			ith := g_list_nth_data (handle,i)
			jth := g_list_nth_data (handle,j)

			tmp := g_list_get_data(ith)
			g_list_set_data (ith, g_list_get_data(jth))
			g_list_set_data (jth, tmp)
		end

	set_all_with (v: like first) is
		local ith:POINTER
		do
			from ith:=handle
			until ith.is_null
			loop
				g_list_set_data (ith, v.handle)
				ith := g_list_get_next (ith)
			end
		end

	clear_all is do not_yet_implemented end

	add_first (element: like first) is
		do
			handle := g_list_prepend (handle, element.handle)
		end

	add_last (element: like first) is
			-- Note that add_last has to traverse the entire list to find
			-- the end, which is inefficient when adding multiple
			-- elements. A common idiom to avoid the inefficiency is to
			-- prepend the elements and reverse the list when all
			-- elements have been added.
		do
			handle := g_list_append (handle, element.handle)	
		end

	add (element: like first; index: INTEGER) is
		do
			handle := g_list_insert (handle, element.handle, index-1)
		end

	
	append_collection (other: COLLECTION[ITEM]) is
		do
			not_yet_implemented -- TODO
		end

	force (element: like first; index: INTEGER) is do not_yet_implemented end

	remove_first is
		do
			handle:=g_list_delete_link (handle, handle)
		end

	remove (index: INTEGER) is
		do
			handle:=g_list_delete_link (handle,
												  g_list_nth_data (handle, index-1))
		end

	remove_last is
		do
			handle:=g_list_delete_link (handle,g_list_last (handle))
		end

	clear_count, clear_count_and_capacity is
			-- Discard all items (is_empty is True after that call). Frees
			-- all of the memory used by a GList. The freed elements are
			-- added to the GAllocator free list.
		do
			g_list_free (handle)
			handle := Null -- default_pointer
		end

	has (x: like first): BOOLEAN is
			-- Look for x using is_equal for comparison. Note: current
			-- implementation is just a copy of `fast_has'; try using
			-- `fast_has' whenever possible since an implementation of
			-- `has' that really uses `is_equal' will be quite slow.
		do
			Result:=fast_has(x)
		end
	
	fast_has (x: like first): BOOLEAN is
			-- Look for x using basic = for comparison.
		do
			if (g_list_find(handle,x.handle).is_not_null)
			then Result:=True
			else check Result=False end
			end
		end
	
	first_index_of (element: like first): INTEGER is
			-- Give the index of the first occurrence of element using
			-- is_equal for comparison. Answer upper + 1 when element is
			-- not inside.
		do
			Result:=g_list_index(handle,element.handle)
		end

	index_of (element: like first; start_index: INTEGER): INTEGER is
		do
			Result:=first_index_of(element)
		end

	reverse_index_of (element: like first; start_index: INTEGER): INTEGER is do not_yet_implemented end

	fast_first_index_of (element: like first): INTEGER is
			-- Give the index of the first occurrence of element using
			-- basic = for comparison. Answer upper + 1 when element is
			-- not inside.
		do
			not_yet_implemented -- TODO
		end

	fast_index_of (element: like first; start_index: INTEGER): INTEGER is do not_yet_implemented end

	fast_reverse_index_of (element: like first; start_index: INTEGER): INTEGER  is
			-- Using basic = comparison, gives the index of the first
			-- occurrence of element at or before start_index. Search is
			-- done in reverse direction, which means from the
			-- start_index down to the lower index . Answer lower -1 when
			-- the search fail.
		do
			not_yet_implemented -- TODO
		end

	is_equal_map (other: LINKED_COLLECTION [ITEM]): BOOLEAN is
			-- Do both collections have the same lower, upper, and items?
			-- Feature is_equal is used for comparison of items.
		do
			not_yet_implemented -- TODO
		end

	all_default: BOOLEAN is
			--	Do all items have their type s default value? Note: for
			--	non Void items, the test is performed with the is_default
			--	predicate.
		do
			not_yet_implemented -- TODO
		end

	copy (other: like Current) is
		do
			not_yet_implemented -- TODO
		end

	occurrences (element: like first): INTEGER is
			-- Number of occurrences of element using is_equal for comparison.
		do
			not_yet_implemented -- TODO
		end

	fast_occurrences (element: like first): INTEGER is 
		do
			not_yet_implemented -- TODO
		end
	

	replace_all (old_value, new_value: like first) is 
		do
			not_yet_implemented -- TODO
		end

	fast_replace_all (old_value, new_value: like first) is 
		do
			not_yet_implemented -- TODO
		end

	slice (min, max: INTEGER): G_LIST [ITEM] is 
		do
			not_yet_implemented -- TODO
		end

	reverse is
		local old_handle: POINTER
		do
			old_handle := handle
			handle:=g_list_reverse (handle)
			g_list_free (handle) -- TODO is this call correct?
		end

	upper,count: INTEGER is 
		do
			Result:=g_list_length(handle)
		ensure positive: Result >= 0 
		end

	empty, is_empty: BOOLEAN is 
		do
			Result:= (handle.is_null)
		end
	
	from_collection (model: COLLECTION[ITEM]) is do not_yet_implemented end
	
	get_new_iterator: ITERATOR[ITEM] is 
		do
			create {ITERATOR_ON_G_LIST[ITEM]} Result.make (Current)
		ensure valid: Result/=Void
		end


	-- Glib's doc, useful for implementing unimplemented
	
-- typedef struct {
--   gpointer data;
--   GList *next;
-- } GList;

-- The GList struct is used for each element in the singly-linked list.
	-- gpointer data; 	holds the element's data, which can be a pointer to any kind of data, or any integer value using the Type Conversion Macros.
	-- GList *next; 	contains the link to the next element in the list.
	-- g_list_alloc ()

-- GList*     g_list_alloc                   (void);

-- Allocates space for one GList element. It is called by the g_list_append(), g_list_prepend(), g_list_insert() and g_list_insert_sorted() functions and so is rarely used on its own.
-- Returns : 	a pointer to the newly-allocated GList element.

	append (an_item: like first) is
			-- Adds `an_item' on to the end of the list.
		do
			handle:=g_list_append (handle, an_item.handle)

			-- Note: The return value is the new start of the list, which may have changed, so make sure you store the new value.
			
			-- Note: g_list_append() has to traverse the entire list to
			-- find the end, which is inefficient when adding multiple
			-- elements. A common idiom to avoid the inefficiency is to
			-- prepend the elements and reverse the list when all
			-- elements have been added.

			--   /* Notice that these are initialized to the empty list. */
			--   GList *list = NULL, *number_list = NULL;
			
			--   /* This is a list of strings. */
			--   list = g_list_append (list, "first");
			--   list = g_list_append (list, "second");
			
			--   /* This is a list of integers. */
			--   number_list = g_list_append (number_list, GINT_TO_POINTER (27));
			--   number_list = g_list_append (number_list, GINT_TO_POINTER (14));
		end

			
	prepend  (an_item: like first) is
			-- Adds a new element on to the start of the list.
		require valid_item: an_item/=Void
		do
			handle := g_list_prepend (handle,an_item.handle)
			-- Note: The return value is the new start of the list, which
			-- may have changed, so make sure you store the new value.

			-- /* Notice that it is initialized to the empty list. */
			-- GList *list = NULL; list = g_list_prepend (list,
			-- "last"); list = g_list_prepend (list, "first");
		end


-- g_list_insert ()

-- GList*     g_list_insert                  (GList *list, gpointer data, gint position);

-- Inserts a new element into the list at the given position.
-- list : 	a GList.
-- data : 	the data for the new element.
-- position : 	the position to insert the element. If this is negative, or is larger than the number of elements in the list, the new element is added on to the end of the list.
-- Returns : 	the new start of the GList.
-- g_list_insert_before ()

-- GList*     g_list_insert_before           (GList *slist, GList *sibling, gpointer data);

-- Inserts a node before sibling containing data. Returns the new head of the list.
-- slist : 	a GList.
-- sibling : 	node to insert data before.
-- data : 	data to put in the newly-inserted node.
-- Returns : 	new head of the list.
-- g_list_insert_sorted ()

-- GList*     g_list_insert_sorted           (GList *list, gpointer data, GCompareFunc func);

-- Inserts a new element into the list, using the given comparison function to determine its position.
-- list : 	a GList.
-- data : 	the data for the new element.
-- func : 	the function to compare elements in the list. It should return a number > 0 if the first parameter comes after the second parameter in the sort order.
-- Returns : 	the new start of the GList.
-- g_list_remove ()

-- GList*     g_list_remove                  (GList *list, gconstpointer data);

-- Removes an element from a GList. If two elements contain the same data, only the first is removed. If none of the elements contain the data, the GList is unchanged.
-- list : 	a GList.
-- data : 	the data of the element to remove.
-- Returns : 	the new start of the GList.
-- g_list_remove_link ()

-- GList*     g_list_remove_link             (GList *list, GList *link_);

-- Removes an element from a GList, without freeing the element. The removed element's next link is set to NULL, so that it becomes a self-contained list with one element.
-- list : 	a GList.
-- link_ : 	an element in the GList.
-- Returns : 	the new start of the GList, without the element.
-- g_list_delete_link ()

-- GList*     g_list_delete_link             (GList *list, GList *link_);

-- Deletes a node of list. Returns the new list head.
-- list : 	a GList.
-- link_ : 	node to delete.
-- Returns : 	new head of list.
-- g_list_remove_all ()

-- GList*     g_list_remove_all              (GList *list, gconstpointer data);

-- Removes all list nodes with data equal to data. Returns the new head of the list. Contrast with g_list_remove() which removes only the first node matching the given data.
-- list : 	a GList.
-- data : 	data to remove.
-- Returns : 	new head of list.
-- g_list_free ()

-- void        g_list_free                    (GList *list);

-- Frees all of the memory used by a GList. The freed elements are added to the GAllocator free list.
-- list : 	a GList.
-- g_list_free_1 ()

-- void        g_list_free_1                  (GList *list);

-- Frees one GList element. It is usually used after g_list_remove_link().
-- list : 	a GList element.
-- g_list_length ()

-- guint       g_list_length                  (GList *list);

-- Gets the number of elements in a GList.
-- list : 	a GList.
-- Returns : 	the number of elements in the GList.
-- g_list_copy ()

-- GList*     g_list_copy                    (GList *list);

-- Copies a GList.

-- Note that this is a "shallow" copy. If the list elements consist of pointers to data, the pointers are copied but the actual data isn't.
-- list : 	a GList.
-- Returns : 	a copy of list.
-- g_list_reverse ()

-- GList*     g_list_reverse                 (GList *list);

-- Reverses a GList.
-- list : 	a GList.
-- Returns : 	the start of the reversed GList.
-- g_list_sort ()

-- GList*     g_list_sort                    (GList *list, GCompareFunc compare_func);

-- Sorts a GList using the given comparison function.
-- list : 	a GList.
-- compare_func : 	the comparison function used to sort the GList. This function is passed the data from 2 elements of the GList and should return 0 if they are equal, a negative value if the first element comes before the second, or a positive value if the first element comes after the second.
-- Returns : 	the start of the sorted GList.
-- g_list_sort_with_data ()

-- GList*     g_list_sort_with_data          (GList *list, GCompareDataFunc compare_func, gpointer user_data);

-- Like g_list_sort(), but the sort function accepts a user data argument.
-- list : 	a GList
-- compare_func : 	comparison function.
-- user_data : 	data to pass to comparison function.
-- Returns : 	new head of the list.
-- g_list_concat ()

-- GList*     g_list_concat                  (GList *list1, GList *list2);

-- Adds the second GList onto the end of the first GList. Note that the elements of the second GList are not copied. They are used directly.
-- list1 : 	a GList.
-- list2 : 	the GList to add to the end of the first GList.
-- Returns : 	the start of the new GList.
-- g_list_foreach ()

-- void        g_list_foreach                 (GList *list, GFunc func, gpointer user_data);

-- Calls a function for each element of a GList.
-- list : 	a GList.
-- func : 	the function to call with each element's data.
-- user_data : 	user data to pass to the function.
-- g_list_last ()

-- GList*     g_list_last                    (GList *list);

-- Gets the last element in a GList.
-- list : 	a GList.
-- Returns : 	the last element in the GList, or NULL if the GList has no elements.
-- g_list_next()

-- #define     g_list_next(slist)

-- A convenience macro to gets the next element in a GList.
-- slist : 	an element in a GList.
-- Returns : 	the next element, or NULL if there are no more elements.
-- g_list_nth ()

-- GList*     g_list_nth                     (GList *list, guint n);

-- Gets the element at the given position in a GList.
-- list : 	a GList.
-- n : 	the position of the element, counting from 0.
-- Returns : 	the element, or NULL if the position is off the end of the GList.
-- g_list_nth_data ()

-- gpointer    g_list_nth_data                (GList *list, guint n);

-- Gets the data of the element at the given position.
-- list : 	a GList.
-- n : 	the position of the element.
-- Returns : 	the element's data, or NULL if the position is off the end of the GList.
-- g_list_find ()

-- GList*     g_list_find                    (GList *list, gconstpointer data);

-- Finds the element in a GList which contains the given data.
-- list : 	a GList.
-- data : 	the element data to find.
-- Returns : 	the found GList element, or NULL if it is not found.
-- g_list_find_custom ()

-- GList*     g_list_find_custom             (GList *list, gconstpointer data, GCompareFunc func);

-- Finds an element in a GList, using a supplied function to find the desired element. It iterates over the list, calling the given function which should return 0 when the desired element is found. The function takes two gconstpointer arguments, the GList element's data as the first argument and the given user data.
-- list : 	a GList.
-- data : 	user data passed to the function.
-- func : 	the function to call for each element. It should return 0 when the desired element is found.
-- Returns : 	the found GList element, or NULL if it is not found.
-- g_list_position ()

-- gint        g_list_position                (GList *list, GList *llink);

-- Gets the position of the given element in the GList (starting from 0).
-- list : 	a GList.
-- llink : 	an element in the GList.
-- Returns : 	the position of the element in the GList, or -1 if the element is not found.
-- g_list_index ()

-- gint        g_list_index                   (GList *list, gconstpointer data);

-- Gets the position of the element containing the given data (starting from 0).
-- list : 	a GList.
-- data : 	the data to find.
-- Returns : 	the index of the element containing the data, or -1 if the data is not found.
-- g_list_push_allocator ()

-- void        g_list_push_allocator          (GAllocator *allocator);

-- Sets the allocator to use to allocate GList elements. Use g_list_pop_allocator() to restore the previous allocator.

-- Note that this function is not available if GLib has been compiled with --disable-mem-pools
-- allocator : 	the GAllocator to use when allocating GList elements.
-- g_list_pop_allocator ()

-- void        g_list_pop_allocator           (void);

-- Restores the previous GAllocator, used when allocating GList elements.

-- Note that this function is not available if GLib has been compiled with --disable-mem-pools

end



