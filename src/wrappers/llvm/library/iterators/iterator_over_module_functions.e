-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ITERATOR_OVER_MODULE_FUNCTIONS

inherit 
	BIDIRECTIONAL_ITERATOR[LLVM_FUNCTION]
	LLVM_FUNCTION_FACTORY

insert CORE_EXTERNALS

creation from_module

feature {LLVM_MODULE}
	from_module (a_module: LLVM_MODULE) is
		require a_module/=Void
		do
			module:=a_module
		end

feature 
	module: LLVM_MODULE

	start is
		do
			item := wrapper_or_void(llvmget_first_function(module.handle))
		end
	
	finish is
		do
			item := wrapper_or_void(llvmget_last_function(module.handle))
		end

	next is
		do
			item := wrapper_or_void(llvmget_next_function(module.handle))
		end
		
	previous is
		do
			item := wrapper_or_void(llvmget_previous_function(module.handle))
		end

	is_off: BOOLEAN is
		do
			Result:=(item=Void)
		end

	item: LLVM_FUNCTION is attribute end

invariant module/=Void

end -- class ITERATOR_OVER_MODULE_FUNCTIONS

--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.

