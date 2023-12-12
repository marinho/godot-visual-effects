shader_type spatial;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
	vec4 currentColor = textureLod(screen_texture, SCREEN_UV, 0.0);
	ALBEDO = currentColor.rgb * vec3(10.0, 0.0, 0.0);
	ALPHA = 1.;
}
