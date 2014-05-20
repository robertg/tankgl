express = require 'express'

app = express()
app.set 'view engine', 'toffee'
#Make sure to serve everything in /../ since this file is run in dist/.
app.use(express.static(__dirname + '/../public'))

app.use (require 'connect-assets')()

app.listen (process.env.PORT || 3000)

#Routes:
#=====================================================
view_payload =
  js: js
  css: css
app.get '/', (req, res) ->
  res.render 'index.toffee', view_payload
#=====================================================


#Open up websocket:
WebSocket = require('ws')

WebSocketServer = WebSocket.Server
wss = new WebSocketServer({port: 8080})
wss.on('connection', (s) ->
  array = new Float32Array(5)
  array[i] = i / 2 for i in [0..array.length]
  s.send(array, {binary: true})
)
