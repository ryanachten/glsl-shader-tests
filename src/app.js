import React from 'react';
import ReactDOM from 'react-dom';

import * as THREE from 'three';

// import AppName from './components/AppName';

import 'normalize.css/normalize.css';
import './styles/style.scss';

// ReactDOM.render( <p>AppName component goes here</p>, document.getElementById('app') );


const container = document.getElementById('container');
const camera = new THREE.Camera();
const scene = new THREE.Scene();
const renderer = new THREE.WebGLRenderer();
const uniforms = {
    u_time: { type: "f", value: 1.0 },
    u_resolution: { type: "v2", value: new THREE.Vector2() },
    u_mouse: { type: "v2", value: new THREE.Vector2() }
};

init();
animate();

function init(){
    camera.position.z = 1;

    const geometry = new THREE.PlaneBufferGeometry(2,2);

    const material = new THREE.ShaderMaterial({
      uniforms: uniforms,
      vertexShader: document.getElementById( 'vertexShader' ).textContent,
      fragmentShader: document.getElementById( 'fragmentShader' ).textContent
    });

    const mesh = new THREE.Mesh(geometry, material);
    scene.add(mesh);

    renderer.setPixelRatio(window.devicePixelRatio);

    container.appendChild( renderer.domElement );

    onWindowResize();
    window.addEventListener( 'resize', onWindowResize, false );

    document.onmousemove = function(e){
      uniforms.u_mouse.value.x = e.pageX;
      uniforms.u_mouse.value.y = e.pageY;
    }
}

function onWindowResize(){
  renderer.setSize( window.innerWidth, window.innerHeight );
  uniforms.u_resolution.value.x = renderer.domElement.width;
  uniforms.u_resolution.value.y = renderer.domElement.height;
}

function animate() {
  requestAnimationFrame( animate );
  render();
}

function render(){
  uniforms.u_time.value += 0.05;
  renderer.render( scene, camera );
}
