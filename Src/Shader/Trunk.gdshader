shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

uniform float brightness : hint_range(0.0, 1.0) = 1.0;
uniform float contrast = 1.0;
uniform float saturation = 1.0;

void fragment() {
    vec3 c = COLOR.rgb;
	//textureLod(screen_texture, SCREEN_UV, 0.0).rgb;
	
	c = c * vec3(1, 1, 0);
	c = c * vec3(length(c));
	c = vec3(length(c));
	c = step(.8, c);
	
	vec3 poisonMask = c;
	vec3 invertedMask = vec3(1) - poisonMask;
	
	//c = c * vec3(.5, .7, .1);

    //c.rgb = mix(vec3(0.0), c.rgb, brightness);
    //c.rgb = mix(vec3(0.5), c.rgb, contrast);
    //c.rgb = mix(vec3(dot(vec3(1.0), c.rgb) * 0.333333), c.rgb, saturation);

    COLOR.rgb = poisonMask * vec3(.5, .7, .1) + invertedMask * COLOR.rgb;
}