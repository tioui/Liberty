class SQUARE

inherit
	GL_OBJECT
		redefine draw
		end

creation
	make_with_position

feature{ANY}
	build is
		do
		end

	draw is
		local
			color: GL_COLOR
		do
			gl.disable(gl.const_cull_face)
			create color.set_color(0.5, 0.5, 1, 1)
			smart_gl.rotate(angle, 1, 0, 0)
			smart_gl.begin_quads
			color.render
			smart_gl.vertex(-1, 1, 0)
			smart_gl.vertex(-1, -1, 0)
			smart_gl.vertex(1, -1, 0)
			smart_gl.vertex(1, 1, 0)
			smart_gl.end_primitive
		end
		
	anim (widget: GL_WIDGET): BOOLEAN is
		do
			angle := angle - 1.5
			widget.display_gl
			--post_redisplay
			Result := True
		end

feature{}
	angle: REAL

end