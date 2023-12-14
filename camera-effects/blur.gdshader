shader_type canvas_item;

uniform float lod : hint_range(0.0, 5.0) = 0.0;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear;

void fragment() {
	vec4 col = texture(SCREEN_TEXTURE, UV, lod);
	COLOR = col;
}
