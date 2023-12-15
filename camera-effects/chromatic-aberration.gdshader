shader_type canvas_item;

// based on https://www.youtube.com/watch?v=aVzY6n3e19A

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear;
uniform float strength = 20.0;
uniform float focus_radius : hint_range(0.0, 1.0) = 0.0;
uniform float focus_edge : hint_range(0.0, 1.0) = 0.0;

void fragment() {
	vec2 CENTER = vec2(0.5, 0.5);
	float d = distance(SCREEN_UV, CENTER);
	float within_radius = smoothstep(focus_radius, focus_radius + focus_edge, d);
	
	vec2 offset = vec2(strength * within_radius, 0.0) * SCREEN_PIXEL_SIZE;
	float red = texture(SCREEN_TEXTURE, SCREEN_UV - offset).r;
	float green = texture(SCREEN_TEXTURE, SCREEN_UV).g;
	float blue = texture(SCREEN_TEXTURE, SCREEN_UV + offset).b;
	
	COLOR = vec4(red, green, blue, 1.0);
}
