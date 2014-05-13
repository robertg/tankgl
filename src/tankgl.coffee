express = require 'express'
app = express()
app.set 'view engine', 'toffee'
app.use express.static(__dirname + '/public')
app.use (require 'connect-assets')()
app.listen (process.env.PORT || 3000)

#Routes:
view_payload =
  js: js
  css: css
#=====================================================
app.get '/', (req, res) ->
  res.render 'index.toffee', view_payload
#=====================================================