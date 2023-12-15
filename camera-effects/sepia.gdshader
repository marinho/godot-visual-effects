shader_type canvas_item;

// based on: https://www.shadertoy.com/view/Xl3cDn

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear;

void fragment() {
    vec4 col = texture(SCREEN_TEXTURE, UV);

	vec3 sepia = vec3(
        col.r * .393 + col.g *.769 + col.b * .189,
        col.r * .349 + col.g *.686 + col.b * .168,
		col.r * .272 + col.g *.534 + col.b * .131);
		
	COLOR = vec4(sepia, 1.0);
}
