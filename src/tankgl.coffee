express = require 'express'
app = express()
app.set 'view engine', 'toffee'
app.listen (process.env.PORT || 3000)


app.get '/', (req, res) ->
  res.send 'Hello World'
