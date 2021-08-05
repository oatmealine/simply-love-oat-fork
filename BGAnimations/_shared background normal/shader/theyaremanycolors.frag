// made by oatmealine

#version 130

#define scale 8.0
#define scaleFg 1.5

#define alpha ((1.0 - fract(time * 7.0)) * 0.5 + 0.4)

uniform float time;
uniform float angle = 0.3;
uniform vec2 resolution;
varying vec4 color;

vec2 rotateVec(vec2 v, float a){
  float s = sin(a);
  float c = cos(a);
  mat2 m = mat2(c, -s, s, c);
  return m * (v - .5) + .5;
}

float hash(float p) {
	p = fract(p * .1031);
	p *= p + 33.33;
	p *= p + p;
	return fract(p);
}

vec3 lines(vec2 uv) {
	bool mirror = false;
	
	uv += time * 0.3; // Offset lines
	uv = rotateVec(uv, angle);
	
	if (fract(uv.x * scale/2.0) > 0.5) {
		uv.x += uv.y;   // Make it diagonal
	} else {
		mirror = true;
		uv.x -= uv.y;   // Make it diagonal
	}
	uv *= scale;     // Upscale
	uv = fract(uv); // Fraction
	
	vec3 col = vec3(0.0, 0.0, 0.0); // Background color
			
	if (mirror) {
		col = mix(color.rgb, col, step(uv.x, 0.5)); // Line color
	} else {
		col = mix(col, color.rgb, step(uv.x, 0.5)); // Line color
	}
	
	return col * alpha;
}

void main()
{
	vec2 uv = gl_FragCoord.xy/resolution.xy;
	uv += 0.1;
	uv /= 1.5;
	uv.x *= resolution.x / resolution.y;
	
	float angleOffset = hash(floor(time * 0.7)) * 3.14;
	
	gl_FragColor = vec4(lines(rotateVec(uv, angleOffset)) + lines(rotateVec(uv * scaleFg + 0.2, angle * 2.0 + angleOffset)) * 0.2, color.a);
}
