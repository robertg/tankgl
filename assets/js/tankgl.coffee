scene = new THREE.Scene
camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 )
camera.position.z = 5

scene.add camera
renderer = new THREE.WebGLRenderer
renderer.setSize( window.innerWidth, window.innerHeight )
document.getElementById('game').appendChild( renderer.domElement )

host = "localhost"

socket = new WebSocket("ws://#{host}:8080")
socket.binaryType = "arraybuffer"

#Events:
socket.onopen = -> console.log "connected"
socket.onmessage = (e) ->
  view = new DataView(e.data)
  #console.log view.getFloat32(i*4,false) for i in [0 ... 5]

animate = ->
  requestAnimationFrame( animate )
  controls.update()

render = ->
  renderer.render( scene, camera )

controls = new THREE.OrbitControls( camera )
controls.addEventListener( 'change', render )


onload = ->
  tank_top = new THREE.SkinnedMesh(this.top_geo,
      new THREE.MeshBasicMaterial({wireframe:true, transparent: false}))
  tank_bottom = new THREE.SkinnedMesh(this.bottom_geo,
      new THREE.MeshBasicMaterial({wireframe:true, transparent: false}))
  scene.add tank_top
  scene.add tank_bottom

  # tank.top.scale.set(prop.scale.x, prop.scale.y, prop.scale.z)
  # tank.top.position.set(prop.pos.x, prop.pos.y, prop.pos.z)
  # tank.top.rotation.set(prop.rot.x, prop.rot.y, prop.rot.z)

  # tank.bottom.scale.set(prop.scale.x, prop.scale.y, prop.scale.z)
  # tank.bottom.position.set(prop.pos.x, prop.pos.y, prop.pos.z)
  # tank.bottom.rotation.set(prop.rot.x, prop.rot.y, prop.rot.z)


loader = new THREE.JSONLoader()
loader.load("/game/model/tank_top.js", (geometry) =>
  @top_geo = geometry;
  loader.load("/game/model/tank_bottom.js", (geometry) =>
    @bottom_geo = geometry;
    onload()
    console.log "loaded"
  )
)
