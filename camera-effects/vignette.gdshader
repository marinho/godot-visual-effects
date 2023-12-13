shader_type canvas_item;

uniform vec4 color : source_color;
uniform float speed = 3.0;
uniform float pulse_strength = 0.1;
uniform float internal_radius = 0.4;
uniform float external_radius = 0.7;

float smoothCircle(vec2 center, float positioner, vec2 uv)
{
	float d = distance(center, uv);
    return smoothstep(internal_radius + positioner, external_radius + positioner, d);
}

void fragment() {
	vec2 CENTER = vec2(0.5, 0.5);
	float position = sin(TIME * speed) * pulse_strength;
	float circle = smoothCircle(CENTER, position, UV);
	COLOR = vec4(color.rgb, circle);
}
