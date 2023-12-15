shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform vec4 colorDarkness : source_color = vec4(0.0, 0.0, 0.0, 1.0);
uniform vec4 colorLight : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float colorDivider : hint_range(0.0, 1.0) = .5;

void fragment() {
	vec4 pixelColor = texture(SCREEN_TEXTURE, SCREEN_UV);
	float grayscaleValue = dot(pixelColor.rgb, vec3(0.299, 0.587, 0.114));
	COLOR = grayscaleValue < colorDivider ? colorDarkness : colorLight;
}
