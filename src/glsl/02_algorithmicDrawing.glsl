#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;


// Plot a line on Y using a value between 0.0-1.0
float plot(vec2 st, float pct){
  return  smoothstep( pct-0.02, pct, st.y) -
          smoothstep( pct, pct+0.02, st.y);

  // Creates a green gradient in the center
  // return  smoothstep( 0.2, 0.5, st.x) -
  //         smoothstep( 0.5, 0.8, st.x);
}

// *** Shaping functions ***
// void main() {
// 	vec2 st = gl_FragCoord.xy/u_resolution;
//
//     // Linear
//     // float y = st.x;
//
//     // Ease-in
//     float y = pow(st.x, 0.02);
//
//
//     vec3 color = vec3(y);
//
//     // Plot a line
//     float pct = plot(st,y);
//     color = (1.0-pct)*color+pct*vec3(0.0,1.0,0.0);
//
// 	gl_FragColor = vec4(color,1.0);
// }


// *** Step and Smooth step ***
// void main() {
//     vec2 st = gl_FragCoord.xy/u_resolution;
//
//     // Step will return 0.0 unless the value is over 0.5 -  in that case it will return 1.0
//     // float y = step(0.5,st.x);
//
//     // Smooth interpolation between 0.1 and 0.9
//     float y = smoothstep(0.1,0.9,st.x);
//
//     vec3 color = vec3(y);
//
//     float pct = plot(st,y);
//     color = (1.0-pct)*color+pct*vec3(0.0,1.0,0.0);
//
//     gl_FragColor = vec4(color,1.0);
// }

// *** Sin and Cos ***

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution;

    //Bouncing ball
    float y = abs(sin(u_time - st.x));

    // Dolphin dives
    // float y = sin(u_time - st.x);

    // Phases
    // float y = fract(sin(u_time - st.x));

    // Shrinking waves
    // float y = sin(u_time * st.x);

    // Square waves
    // float y = ceil(sin(u_time * st.x)) + floor(sin(u_time * st.x));

    // Shifts
    // float y = sin(u_time + PI * st.x);

    // Mod shifts
    // float y = mod(u_time + st.x, 0.5);

    vec3 color = vec3(y);

    float pct = plot(st,y);
    color = (1.0-pct)*color+pct*vec3(0.0,1.0,0.0);

    gl_FragColor = vec4(color,1.0);
}
