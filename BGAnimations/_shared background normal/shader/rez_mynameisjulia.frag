#version 120
#define res resolution

uniform vec2 resolution;
varying vec2 imageCoord;
varying vec4 color;

uniform sampler2D sampler0;
uniform float beat;
uniform float time;

float r=0.25;
float g=0.225;
float b=0.175;

bool t_flag=false;
float t=0.0;
float t_buffer=0.0;

vec2 zkal(vec2 a)
	{
	float v=0.625-0.5*cos(time*0.1);
	float z=8.0;
	a.x=abs(a.x*(v*z));
	a.y=-a.y*(v*z);
	float m=dot(a*0.7,a*0.2);
	a/=m;
	return a;
	}

vec3 getcolor(vec2 p)
	{
	vec2 z=p;
	const int it=64;
	for(int i=0;i<it;i++)
		{
		z=zkal(vec2(z))-0.01*float(it-i);
		}
	float a=4.0*sin(z.x)+4.0*sin(z.y);
	float co=1.375*log2(log2(length(z)*6.0));
	return vec3(r*co+0.0625*cos(a),g*co-0.025*sin(a),b*co-0.0625*sin(a));
	}

void main()
	{
	float zoom=5.0-4.0*cos(time*0.2);
	vec2 position=zoom*gl_FragCoord.xy/res.xy-zoom*0.5;
	position.x*=res.x/res.y;
	gl_FragColor=vec4(getcolor(vec2(position)),1.0);
	}