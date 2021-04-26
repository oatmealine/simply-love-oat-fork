#version 130

#define PI 3.14159265
#define saturate(i) clamp(i,0.,1.)
#define linearstep(a,b,t) saturate(((t)-(a))/((b)-(a)))

uniform sampler2D sampler0;

varying vec4 color;

uniform float time;

uniform float ptime = 0;

uniform float bias;
uniform vec2 imageSize;
uniform vec2 textureSize;
varying vec2 textureCoord;
varying vec2 imageCoord;

uniform sampler2D bayer;

uniform float bayerResolution = 0.01;


uniform float mood = 1;



vec2 img2tex( vec2 v ) { return v / textureSize * imageSize; }

// https://www.shadertoy.com/view/4tSBDK

#define COLORS_PER_CHANNEL 5.0
#define R (1.0 / COLORS_PER_CHANNEL)

vec3 palettize(vec3 color) {
    vec3 newColor;
    modf(color.r * COLORS_PER_CHANNEL, newColor.r);
    modf(color.g * COLORS_PER_CHANNEL, newColor.g);
    modf(color.b * COLORS_PER_CHANNEL, newColor.b);
    return newColor / COLORS_PER_CHANNEL;
}

float dithering(vec2 uv) {
    vec2 tex;
    tex.x = mod(uv.x, bayerResolution);
    tex.y = mod(uv.y, bayerResolution);
    tex = tex / bayerResolution;
    return R * float(texture2D(bayer, fract(img2tex(tex)))) ;
}





// https://www.bidouille.org/prog/plasma

void main() {

	vec2 uv = imageCoord;

	float u_k = 20;
	float u_time = ptime*3;

    float v = 0.0;
    vec2 c = uv * u_k - u_k/2.0;
    v += sin((c.x+u_time));
    v += sin((c.y+u_time)/2.0);
    v += sin((c.x+c.y+u_time)/2.0);
    c += u_k/2.0 * vec2(sin(u_time/3.0), cos(u_time/2.0));

	v += sin(sqrt(c.x*c.x+c.y*c.y+1)+u_time*0.25);

	v = v/2.0;

	vec3 col;

	//blue
	if( mood == 0 ){
		col = ((vec3(.2,sin(PI*1*v)*.25,sin(PI*1*v)*.5))+vec3(0,.5,1))*0.6;
	}
	//peaceful
	if( mood == 1 ){
		col = vec3(sin(PI*0.5*v)*0.5, 0.25*sin(PI*0.5*v + PI*-0.5), sin(PI*0.5*v + PI*-1))*.5 + .5;
	}
	//A n g e r y
	if( mood == 2 ){
		col = vec3(sin(PI*2*v)*.1,0,0) + vec3(.3,0,0);
	}



	//halcyoniix dither

	//col.g += uv.x;
	col += dithering(uv);
	col = palettize(col.xyz);




	gl_FragColor = vec4(col, 1)*color;

}
