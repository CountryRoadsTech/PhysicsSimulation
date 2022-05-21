import * as THREE from 'three'
import { OrbitControls } from 'OrbitControls'
import {GLTFLoader} from 'GLTFLoader'
import { EXRLoader } from 'EXRLoader'

document.addEventListener("turbo:load", function() {
  const MAX_DISTANCE = 1000000000
  const MODEL_SCALE = 1.0/850.0 // Used to convert scale of models to si units.
  const LABEL_SIZE = 10000

  // Get the HTML Canvas used as the target for the renderer
  const canvas = document.querySelector('#simulation_canvas')
  const renderer = new THREE.WebGLRenderer({canvas, alpha: true, antialias: true, logarithmicDepthBuffer: true})

  // Add a perspective camera
  const fov = 75
  const aspect_ratio = 2
  const near_render_distance = 1
  const camera = new THREE.PerspectiveCamera(fov, aspect_ratio, near_render_distance, MAX_DISTANCE)
  camera.position.z = 1000000

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

  loadPhysicsBodies(scene)

  // Axes default value
  var currentUserSelectedAxes = 'off'
  const axesHelper = new THREE.AxesHelper(MAX_DISTANCE - 1)
  scene.add(axesHelper)
  axesHelper.visible = false

  requestAnimationFrame(render)

  function loadPhysicsBodies(scene) {
    const gltfLoader = new GLTFLoader()

    for (var i = 0; i < gon.physics_bodies.length; i++) {
      loadModel(scene, gltfLoader, gon.physics_bodies[i])
    }
  }

  function loadModel(scene, loader, physics_body) {
    loader.load('/resources/models/' + physics_body['name'] + '.glb', (gltf) => {
      const root = gltf.scene

      const radius = physics_body['radius'] * MODEL_SCALE

      // Scale up to the models radius, and position in the correct location
      root.scale.set(radius, radius, radius)
      root.position.x = physics_body['x']
      root.position.y = physics_body['y']
      root.position.z = physics_body['z']
      scene.add(root)

      // Load a bounding box around the model
      var boundingBox = new THREE.BoxHelper(root, 0xff0000)
      boundingBox.update()
      scene.add(boundingBox)

      // Add a 2D text label above the model
      const canvas = addTextLabel(LABEL_SIZE, physics_body['name']);
      const texture = new THREE.CanvasTexture(canvas);

      texture.minFilter = THREE.LinearFilter;
      texture.wrapS = THREE.ClampToEdgeWrapping;
      texture.wrapT = THREE.ClampToEdgeWrapping;

      const labelMaterial = new THREE.SpriteMaterial({
        map: texture,
        transparent: true,
      });

      const labelGeometry = new THREE.PlaneGeometry(1, 1);

      const label = new THREE.Sprite(labelMaterial);

      root.add(label);
      label.position.y = root.position.y + (2 * LABEL_SIZE);

      label.scale.x = canvas.width;
      label.scale.y = canvas.height;

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

    // Update the background image and axes depending on the user's selection
    checkAndChangeBackgroundImage(textureLoader, scene)
    checkAndChangeAxes()

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

  function checkAndChangeAxes() {

    const userSelection = document.querySelector('input[name="axes"]:checked').value;

    if (userSelection !== currentUserSelectedAxes) {
      currentUserSelectedAxes = userSelection

      if (userSelection == 'on') {
        axesHelper.visible = true
      } else if (userSelection == 'off') {
        axesHelper.visible = false
      } else {
        console.error('Unknown user selection for axes: ' + userSelection)
      }
    }
  }

  function addTextLabel(size, name) {
    const borderSize = 2;
    const ctx = document.createElement('canvas').getContext('2d');
    const font =  `${size}px bold sans-serif`;
    ctx.font = font;

    const textWidth = ctx.measureText(name).width;
    const doubleBorderSize = borderSize * 2;
    const width = LABEL_SIZE + doubleBorderSize;
    const height = size + doubleBorderSize;
    ctx.canvas.width = width;
    ctx.canvas.height = height;

    ctx.font = font;
    ctx.textBaseline = 'middle';
    ctx.textAlign = 'center';
    ctx.fillStyle = 'blue';
    ctx.fillRect(0, 0, width, height);
    const scaleFactor = Math.min(1, LABEL_SIZE / textWidth);
    ctx.translate(width / 2, height / 2);
    ctx.scale(scaleFactor, 1);
    ctx.fillStyle = 'white';
    ctx.fillText(name, borderSize, borderSize);

    return ctx.canvas;
  }
})
