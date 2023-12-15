shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform float blur_amount : hint_range(-2.0, 10.0) = .2;
uniform float strength : hint_range(0.0, 1.0) = .01;

void fragment() {
	float yFromCenter = 1.0 - abs(UV.y - .5);
	float blurImpact = blur_amount * yFromCenter;
	vec2 uv = vec2(SCREEN_UV.x + sin(yFromCenter) * strength, SCREEN_UV.y);
	vec4 blurred = textureLod(SCREEN_TEXTURE, uv, blurImpact);
	
	COLOR = blurred;
}
