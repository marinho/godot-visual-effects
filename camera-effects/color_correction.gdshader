shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear;

// based on: https://godotshaders.com/shader/world-environment-adjustments-for-viewporttextures/

uniform float brightness : hint_range(0.0,8.0) = 1.0;
uniform float contrast : hint_range(0.0,8.0) = 1.0;
uniform float saturation : hint_range(0.0,8.0) = 1.0;

// Use a GradientTexture for the color correction
uniform sampler2D gradient;

void fragment(){
	// Viewport texture
	vec4 input_color = texture(SCREEN_TEXTURE, UV);
	
	//Brightness adjustment
	input_color.rgb = mix(vec3(0.0), input_color.rgb, brightness);
	
	//Contrast adjustment	
    input_color.rgb = mix(vec3(0.5), input_color.rgb, contrast);
	
	//Saturation adjustment	
    input_color.rgb = mix(vec3(dot(vec3(1.0), input_color.rgb) * 0.33333), input_color.rgb, saturation);
	
	// Color correction
	float grayscale_value = dot(input_color.rgb, vec3(0.299, 0.587, 0.114));
	vec3 sampled_color = texture(gradient, vec2(grayscale_value, 0.0)).rgb;
	
	//Final result
	COLOR.rgb = sampled_color;
	COLOR.a = input_color.a;
}
