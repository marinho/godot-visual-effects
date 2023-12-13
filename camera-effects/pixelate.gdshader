shader_type spatial;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear;
uniform int pixel_size = 1;
uniform float alpha = 0.1;

void fragment() {
	// a variant of nearest neighbour fragment shader_type
	float x = float(int(FRAGCOORD.x) % pixel_size);
	float y = float(int(FRAGCOORD.y) % pixel_size);
	
	x = FRAGCOORD.x + floor(float(pixel_size) / 2.0) - x;
	y = FRAGCOORD.y + floor(float(pixel_size) / 2.0) - y;
	
	// set albedo value on the current coordinate based on vec2(x,y) / viewport_size
	ALBEDO = texture(SCREEN_TEXTURE, vec2(x, y) / VIEWPORT_SIZE).xyz;
	ALPHA = alpha;
}
