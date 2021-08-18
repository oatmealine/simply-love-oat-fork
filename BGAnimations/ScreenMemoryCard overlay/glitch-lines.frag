// glitch shader
// shader by nayoto
// first seen in nayoto's fail deadly

// slightly modified to look nice with a basic sprite

#version 120

uniform float amount; // strength [-inf : inf]
uniform vec2 shift; // shift the rgb channels by this much

varying vec4 color;
varying vec2 imageCoord;

uniform float time;
uniform vec2 resolution;
uniform vec2 textureSize;
uniform vec2 imageSize;
uniform sampler2D sampler0;

float rand( vec2 co )
{
	return fract(sin(dot(co.xy,vec2(12.9898,78.233))) * 43758.5453);
}

vec2 img2tex( vec2 v )
{
	return v / textureSize * imageSize;
}

void main()
{
	vec2 uv = imageCoord;
	vec2 uvn = uv;

	uv.x += rand( vec2(uvn.y / 10.0, time / 10.0) ) * amount;
	uv.x -= rand( vec2(uvn.y * 10.0, time * 10.0) ) * amount;

	vec4 col;
	col = texture2D( sampler0, img2tex(mod(uv + shift / resolution, 1.0)) );

	gl_FragColor = col * color;
}
