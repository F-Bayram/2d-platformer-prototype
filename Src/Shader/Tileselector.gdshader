shader_type canvas_item;
render_mode skip_vertex_transform;

uniform vec2 tile_pos;
uniform float tile_size: hint_range(32, 256, 32) = 128.0;

varying flat vec2 world_coords; // vertex coords in world space

void vertex() {
    world_coords = (MODEL_MATRIX * vec4(VERTEX, 0.0, 1.0)).xy;
}

void fragment() {
	vec2 tile_pos_2 = tile_pos - vec2(tile_size);
	float mask = step(world_coords.x, tile_pos.x) * step(world_coords.y, tile_pos.y);
	mask *= 1.0 - step(world_coords.x, tile_pos_2.x) * 1.0 - step(world_coords.y, tile_pos_2.y);
	if (mask == 1.0)
	{
		float edge = length(COLOR.rgb);
		float mask = step(edge, 0.60);
		float invert_mask = 1.0 - mask;
		
		vec3 edge_color = vec3(mask) * vec3(0.8,.4,.8);
		edge_color *= vec3(0.5 + sin(TIME * 10.0), 0.8, 0.9);
		
		vec3 c = edge_color + invert_mask * COLOR.rgb;
		
		COLOR.rgb = c;
	}
}