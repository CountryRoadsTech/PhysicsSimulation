import * as THREE from 'three'
import { OrbitControls } from 'OrbitControls'
import { EXRLoader } from 'EXRLoader'

// Get the HTML Canvas used as the target for the renderer
const canvas = document.querySelector('#simulation_canvas')
const renderer = new THREE.WebGLRenderer({canvas, alpha: true})

// Add a perspective camera
const fov = 75
const aspect_ratio = canvas.width / canvas.height
const near_render_distance = 1
const far_render_distance = 10000
const camera = new THREE.PerspectiveCamera(fov, aspect_ratio, near_render_distance, far_render_distance)
camera.position.z = 2

// Add orbit style controls
const controls = new OrbitControls(camera, canvas)
controls.target.set(0, 0, 0)
controls.update()

// Create the main scene
const scene = new THREE.Scene()

// Set the scene's background
const textureLoader = new THREE.TextureLoader()
const backgroundTexture = textureLoader.load('/resources/images/constellation_figures.png', () => {
      const renderTarget = new THREE.WebGLCubeRenderTarget(backgroundTexture.image.height)
      renderTarget.fromEquirectangularTexture(renderer, backgroundTexture)
      scene.background = renderTarget.texture
    })

requestAnimationFrame(render)

function render(time) {
  time *= 0.001 // Convert time to seconds.

  // Resize the camera if the canvas's size was changed
  if (resizeRendererToDisplaySize(renderer)) {
    const canvas = renderer.domElement
    camera.aspect = canvas.clientWidth / canvas.clientHeight
    camera.updateProjectionMatrix()
  }

  // Update the background image depending on the user's selection
  checkAndChangeBackgroundImage(textureLoader, scene)

  renderer.render(scene, camera)
  requestAnimationFrame(render)
}

function resizeRendererToDisplaySize(renderer) {
  const canvas = renderer.domElement
  const pixelRatio = window.devicePixelRatio
  const width = canvas.clientWidth * pixelRatio | 1
  const height = canvas.clientHeight * pixelRatio | 1

  const needResize = canvas.width !== width || canvas.height !== height
  if (needResize) {
    renderer.setSize(width, height, false)
  }

  return needResize
}

function checkAndChangeBackgroundImage(textureLoader, scene) {

  const userSelection = document.querySelector('input[name="background_image"]:checked').value;

  const backgroundTexture = textureLoader.load('/resources/images/' + userSelection + '.png', () => {
        const renderTarget = new THREE.WebGLCubeRenderTarget(backgroundTexture.image.height)
        renderTarget.fromEquirectangularTexture(renderer, backgroundTexture)
        scene.background = renderTarget.texture
      })
}
