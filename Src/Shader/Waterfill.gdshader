shader_type canvas_item;

uniform float waterfill: hint_range(0, 100, 1) = 0;

void fragment() {
	// Called for every pixel the material is visible on.
	vec3 c = COLOR.rgb * vec3(1.5);
	
	c = mix(c, c * vec3(0.25, 0.78, 0.88) * vec3(3), waterfill * .01);
	
	COLOR.rgb = c;
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}
