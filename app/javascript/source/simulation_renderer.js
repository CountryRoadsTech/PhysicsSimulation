import * as THREE from 'three'

const canvas = document.querySelector('#simulation_canvas')
const renderer = new THREE.WebGLRenderer({canvas})

const fov = 75
const aspect_ratio = 2
const near_render_distance = 0.1
const far_render_distance = 5
const camera = new THREE.PerspectiveCamera(fov, aspect_ratio, near_render_distance, far_render_distance)
camera.position.z = 2

const scene = new THREE.Scene()

const boxWidth = 1
const boxHeight = 1
const boxDepth = 1
const geometry = new THREE.BoxGeometry(boxWidth, boxHeight, boxDepth)
const material = new THREE.MeshBasicMaterial({color: 0x44aa88})
const cube = new THREE.Mesh(geometry, material)

scene.add(cube)

function render(time) {
  time *= 0.001; // Convert time to seconds.

  if (resizeRendererToDisplaySize(renderer)) {
    const canvas = renderer.domElement;
    camera.aspect = canvas.clientWidth / canvas.clientHeight
    camera.updateProjectionMatrix()
  }

  cube.rotation.x = time;
  cube.rotation.y = time;

  renderer.render(scene, camera)
  requestAnimationFrame(render)
}

requestAnimationFrame(render)

function resizeRendererToDisplaySize(renderer) {
  const canvas = renderer.domElement;
  const width = canvas.clientWidth;
  const height = canvas.clientHeight;

  const needResize = canvas.width !== width || canvas.height !== height
  if (needResize) {
    renderer.setSize(width, height, false)
  }

  return needResize
}
