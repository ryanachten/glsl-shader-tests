#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

#define PI 3.141592653589793
#define HALF_PI 1.5707963267948966

float circularIn(float t) {
  return 1.0 - sqrt(1.0 - t * t);
}

float circularOut(float t) {
  return sqrt((2.0 - t) * t);
}

float circularInOut(float t) {
  return t < 0.5
    ? 0.5 * (1.0 - sqrt(1.0 - 4.0 * t * t))
    : 0.5 * (sqrt((3.0 - 2.0 * t) * (2.0 * t - 1.0)) + 1.0);
}

//
// void main() {
//
//   vec3 colorA = vec3(0.149,0.141,0.912);
//   vec3 colorB = vec3(1.000,0.833,0.224);
//
//   float t = u_time*0.1;
//   float pct = circularInOut( abs(fract(t)*2.0-1.) );
//
//   gl_FragColor = vec4(vec3(mix(colorA, colorB, pct)),1.0);
// }


void main() {

  vec3 colorA = vec3(0.333,0.423,0.631); //blue
  vec3 colorB = vec3(0.949,0.529,0.176); //orange

  vec2 st = gl_FragCoord.xy / u_resolution.xy;

  vec3 pct = vec3( st.x, st.y, st.x);

  gl_FragColor = vec4(vec3(mix(colorA, colorB, pct)),1.0);
}
