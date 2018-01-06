// ** Gradient **
// uniform vec2 u_resolution;
//   uniform float u_time;
//
//   void main() {
//       vec2 st = gl_FragCoord.xy/u_resolution.xy;
//       gl_FragColor=vec4(st.x,st.y,0.0,1.0);
//   }

// ** Mouse test **
uniform vec2 u_resolution;
  uniform float u_time;
  uniform vec2 u_mouse;
  // uniform vec2 u_resolution;

  void main() {
      vec2 mouse = u_mouse.xy/u_resolution.xy;
      vec2 st = gl_FragCoord.xy/u_resolution.xy;
      gl_FragColor=vec4(mouse.x,mouse.y,0.0,1.0);
  }
