express = require 'express'
app = express()
app.set 'view engine', 'toffee'
app.use express.static(__dirname + '/public')
app.use (require 'connect-assets')()
app.listen (process.env.PORT || 3000)

app.get '/', (req, res) ->
  res.render 'index.toffee', {js: js}
