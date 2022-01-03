uniform float time;
uniform vec2 imageSize;

float sawtooth(float a, float freq) {
    if (mod(a, freq) < freq * 0.5) return mod(a, freq * 0.5);
    return freq * 0.5 - mod(a, freq * 0.5);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/imageSize.xy;
    float resolutionRatio = imageSize.x / imageSize.y;
    
    uv /= 43.0;
    vec3 mainColor = 0.5 + 0.5*cos(time+uv.xyx+vec3(0,2,4));
    // uv fuckery !
    
    // interlacing .
    float pixAmt = 60.;
    uv = floor(uv * pixAmt) / pixAmt;
    
    if (mod(fragCoord.y, 2.0) < 2.0 * 0.5) {
        uv += 0.1 + sin(time * 0.2 + uv.y * 8.) * 0.05;
    } else {
        uv -= 0.1 + sin(time * 0.2 + uv.y * 8. + .5) * 0.05;
    }
    
    vec2 uv2 = uv;
    
    vec3 color = vec3(0.1);
    
    // first one (bg-ish thing??)
    
    color = vec3(mod(abs(sawtooth(uv.x, 0.6) * resolutionRatio + sawtooth(uv.y, 0.6) + time * 0.3), 0.4)) * mainColor;
    
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
        color = mix(color, lines, 0.3);
    }
    
    // feed the frag color .
    fragColor = vec4(color, 1.0);
}

void main() {
	mainImage(gl_FragColor.rgba, gl_FragCoord.xy);
}
