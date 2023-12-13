shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear;
void fragment() {
    // Readbackground and foreground images.
	vec4 col = texture(SCREEN_TEXTURE, UV);

    // Sepia tone, from
    // https://www.techrepublic.com/blog/how-do-i/how-do-i-convert-images-to-grayscale-and-sepia-tone-using-c
	vec3 sepia = vec3(
        col.r * .393 + col.g *.769 + col.b * .189,
        col.r * .349 + col.g *.686 + col.b * .168,
		col.r * .272 + col.g *.534 + col.b * .131);
		
    // Film grain, from
    // https://www.reddit.com/r/opengl/comments/1rr4fy/any_good_ways_of_generating_film_grain_noise
    const float noiseStrength = 50.0;
    float x = (UV.x + 4.0) * (UV.y + 4.0) * (TIME * 10.0);
    vec3 grain = vec3(mod((mod(x, 13.0) + 1.0) * (mod(x, 123.0) + 1.0), 0.01) - 0.005) * noiseStrength;

    COLOR = vec4(sepia + grain, 1.0);
}
