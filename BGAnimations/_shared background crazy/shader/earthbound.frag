#version 120

uniform float time;
uniform float bpm = 60.;
uniform vec2 imageSize;
varying vec4 color;

uniform float red   = 255./255.;
uniform float blue  = 255./255.;
uniform float green = 255./255.;

// const vec3 mainColor = vec3(106./255., 24./255., 67./255.);

float sawtooth(float a, float freq) {
    if (mod(a, freq) < freq * 0.5) return mod(a, freq * 0.5);
    return freq * 0.5 - mod(a, freq * 0.5);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec3 mainColor = vec3(red, blue, green);
    vec2 uv = fragCoord/imageSize.xy;
    float resolutionRatio = imageSize.x / imageSize.y;
    
    uv /= 80.0;
    // uv fuckery !
    
    // interlacing .
    float pixAmt = 60.;
    uv = floor(uv * pixAmt) / pixAmt;
    
    if (mod(fragCoord.y, 2) < 2 * 0.5) {
        uv += 0.1 + sin(time * 0.2 + uv.y * 8.) * 0.05;
    } else {
        uv -= 0.1 + sin(time * 0.2 + uv.y * 8. + .5) * 0.05;
    }
    
    vec2 uv2 = uv;
    
    vec3 col = vec3(0.1);
    
    // first one (bg-ish thing??)
    
    col = vec3(mod(abs(sawtooth(uv.x, 0.6) * resolutionRatio + sawtooth(uv.y, 0.6) + time * 0.3), 0.4)) * mainColor;
    
    // second one (stripes-like thing)
    
    if (uv2.x < 0.5) {
        uv2.x = 1.0 - uv2.x;
    }
    if (uv2.y > 0.5) {
        uv2.y = 1.0 - uv2.y;
    }

    uv2.x += sin(uv2.y * 4.0 + time) * 0.1;
    
    if (mod(abs(uv2.x * resolutionRatio + uv2.y + time * 0.2), 0.2) < 0.1) {
        vec3 lines = vec3(cos(uv.x * 2.0 + time + uv.y * 3.0)) * mainColor * 0.7;
        col = mix(col, lines, 0.3);
    }
    
    // feed the frag color .
    fragColor = vec4(col, 1.0) * color;
}

void main() {
	mainImage(gl_FragColor.rgba, gl_FragCoord.xy);
}
