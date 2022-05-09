import * as THREE from 'three'
import { OrbitControls } from 'OrbitControls'
import {GLTFLoader} from 'GLTFLoader'
import { EXRLoader } from 'EXRLoader'

document.addEventListener("turbo:load", function() {
  // Get the HTML Canvas used as the target for the renderer
  const canvas = document.querySelector('#simulation_canvas')
  const renderer = new THREE.WebGLRenderer({canvas, alpha: true})

  // Add a perspective camera
  const fov = 75
  const aspect_ratio = canvas.width / canvas.height
  const near_render_distance = 1
  const far_render_distance = 10000
  const camera = new THREE.PerspectiveCamera(fov, aspect_ratio, near_render_distance, far_render_distance)
  camera.position.z = 1000

  // Add orbit style controls
  const controls = new OrbitControls(camera, canvas)
  controls.target.set(0, 0, 0)
  controls.update()

  // Create the main scene
  const scene = new THREE.Scene()

  // Set the scene's background
  var currentSceneBackground = 'constellation_figures' // Default
  const textureLoader = new THREE.TextureLoader()
  const exrLoader = new EXRLoader()
  const backgroundTexture = textureLoader.load('/resources/images/' + currentSceneBackground + '.png', () => {
        const renderTarget = new THREE.WebGLCubeRenderTarget(backgroundTexture.image.height)
        renderTarget.fromEquirectangularTexture(renderer, backgroundTexture)
        scene.background = renderTarget.texture
      })

  // Add lighting
  const lightColor = 0xFFFFFF
  const lightIntensity = 1
  const ambientLight = new THREE.AmbientLight(lightColor, lightIntensity)

  scene.add(ambientLight)

  loadModels(scene)

  requestAnimationFrame(render)

  function loadModels(scene) {
    const gltfLoader = new GLTFLoader()

    const modelPaths = [
      "/resources/models/Sun.glb",
      "/resources/models/Mercury.glb",
      "/resources/models/Venus.glb",
      "/resources/models/Earth.glb",
      "/resources/models/Mars.glb",
      "/resources/models/Jupiter.glb",
      "/resources/models/Saturn.glb",
      "/resources/models/Uranus.glb",
      "/resources/models/Neptune.glb",
      "/resources/models/Pluto.glb"
    ]

    for (var i = 0; i < modelPaths.length; i++) {
      loadModel(scene, gltfLoader, modelPaths[i])
    }
  }

  function loadModel(scene, loader, path) {
    loader.load(path, (gltf) => {
      const root = gltf.scene;
      scene.add(root);
    })
  }

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

    if (userSelection !== currentSceneBackground) {
      currentSceneBackground = userSelection

      if (userSelection == 'milkyway') {
        exrLoader.load('/resources/images/milkyway.exr', function(exrTexture, exrTextureData) {
          const renderTarget = new THREE.WebGLCubeRenderTarget(exrTexture.image.height)
          renderTarget.fromEquirectangularTexture(renderer, exrTexture)
          scene.background = renderTarget.texture
        })
      } else {
        const backgroundTexture = textureLoader.load('/resources/images/' + userSelection + '.png', () => {
              const renderTarget = new THREE.WebGLCubeRenderTarget(backgroundTexture.image.height)
              renderTarget.fromEquirectangularTexture(renderer, backgroundTexture)
              scene.background = renderTarget.texture
            })
      }
    }
  }
})
