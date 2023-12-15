shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear;
uniform int pixel_size = 1;
uniform float alpha = 0.1;

// based on https://www.youtube.com/watch?v=77F4ZjmQ07U

void fragment() {
	vec2 VIEWPORT_SIZE = 1.0 / SCREEN_PIXEL_SIZE;
	
	// a variant of nearest neighbour fragment shader_type
	float x = float(int(FRAGCOORD.x) % pixel_size);
	float y = float(int(FRAGCOORD.y) % pixel_size);
	
	x = FRAGCOORD.x + floor(float(pixel_size) / 2.0) - x;
	y = FRAGCOORD.y + floor(float(pixel_size) / 2.0) - y;
	
	// set albedo value on the current coordinate based on vec2(x,y) / viewport_size
	COLOR = vec4(texture(SCREEN_TEXTURE, vec2(x, y) / VIEWPORT_SIZE).xyz, alpha);
}
