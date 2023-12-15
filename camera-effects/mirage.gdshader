shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform float blur_amount : hint_range(-2.0, 10.0) = .2;
uniform float strength : hint_range(0.0, 1.0) = .01;
uniform float focus : hint_range(0.0, 1.0) = .2;
uniform float centerLine : hint_range(0.0, 1.0) = .5;
uniform float speed : hint_range(0.0, 20.0) = 5.0;
uniform float sepia : hint_range(0.0, 1.0) = 0.0;

vec4 sepiaColor(vec4 col) {
	return vec4(
        col.r * .393 + col.g *.769 + col.b * .189,
        col.r * .349 + col.g *.686 + col.b * .168,
		col.r * .272 + col.g *.534 + col.b * .131,
		col.a
	);
}

void fragment() {
	float d = distance(SCREEN_UV.y, centerLine);
	float yImpact = smoothstep(1.0 - focus, 1.0, 1.0 - d);
	float wavedImpact = yImpact * strength * sin(TIME * speed);
	vec2 uv = vec2(SCREEN_UV.x + wavedImpact, SCREEN_UV.y);
	vec4 blurred = textureLod(SCREEN_TEXTURE, uv, blur_amount * yImpact);
	
	vec4 withSepia = sepiaColor(blurred);
	
	COLOR = mix(blurred, withSepia, sepia);
}
