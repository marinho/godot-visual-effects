shader_type canvas_item;

// based on https://godotshaders.com/shader/simple-blur-mixed-with-a-color/

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform float blur_amount : hint_range(-2.0, 10.0);
uniform float mix_amount : hint_range(0.0, 1.0);
uniform vec4 color_over : source_color;
uniform float focus_radius : hint_range(0.0, 1.0) = 0.1;
uniform float focus_edge : hint_range(0.0, 1.0) = 0.1;

void fragment() {
	vec2 CENTER = vec2(0.5, 0.5);
	float d = distance(SCREEN_UV, CENTER);
	float within_radius = smoothstep(focus_radius, focus_radius + focus_edge, d);
	
	vec4 blurred = textureLod(SCREEN_TEXTURE, SCREEN_UV, blur_amount * within_radius);
	vec4 fin = mix(blurred, color_over, mix_amount);
	COLOR = fin;
}
