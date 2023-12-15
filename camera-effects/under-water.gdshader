shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform float speed : hint_range(0.0, 5.0) = .5;
uniform float strength : hint_range(0.0, 1.0) = .5;
uniform float intensity : hint_range(0.0, 1.0) = .5;
uniform int maximumIterations : hint_range(0, 10) = 5;
uniform bool showTiling = false;
uniform bool showYellowLine = false;

// based on: https://www.shadertoy.com/view/MdlXz8

#define TAU 6.28318530718

void fragment() {
	float time = TIME * speed + 23.0;
    // uv should be the 0-1 uv of texture...
	vec2 iResolution = 1.0 / SCREEN_PIXEL_SIZE;
	vec2 uv = FRAGCOORD.xy / iResolution.xy;
    
	vec2 p;
	if (showTiling) {
		p = mod(uv*TAU*2.0, TAU) - 250.0;
	} else {
	    p = mod(uv*TAU, TAU) - 250.0;
	}

	vec2 i = vec2(p);
	float c = 1.0;
	float inten = intensity / 100.0;

	for (int n = 0; n < maximumIterations; n++) 
	{
		float t = time * (1.0 - (3.5 / float(n+1)));
		i = p + vec2(cos(t - i.x) + sin(t + i.y), sin(t - i.y) + cos(t + i.x));
		c += 1.0/length(vec2(p.x / (sin(i.x+t)/inten),p.y / (cos(i.y+t)/inten)));
	}
	c /= float(maximumIterations);
	c = 1.17-pow(c, 1.4);
	vec3 colour = vec3(pow(abs(c), 8.0));
    colour = clamp(colour + vec3(0.0, 0.35, 0.5), 0.0, 1.0);

	if (showTiling) {
		// Flash tile borders...
		vec2 pixel = 2.0 / iResolution.xy;
		uv *= 2.0;
		float f = floor(mod(TIME * speed, 2.0)); 	// Flash value.
		vec2 first = step(pixel, uv) * f;		   	// Rule out first screen pixels and flash.
		uv  = step(fract(uv), pixel);				// Add one line of pixels per tile.
		
		if (showYellowLine)
			colour = mix(colour, vec3(1.0, 1.0, 0.0), (uv.x + uv.y) * first.x * first.y); // Yellow line
	}
	
	vec4 pixelColor = texture(SCREEN_TEXTURE, UV);
	vec3 appliedColor = mix(pixelColor.rgb, colour, strength);
    
	COLOR = vec4(appliedColor, 1.0);
}
