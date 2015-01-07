ServerModel = require '../models/ServerModel.coffee'

ServersCollection = Backbone.Collection.extend
  model: ServerModel

  subtotal: ->
    _.reduce @models, (memo, server) ->
      memo + server.totalPricePerMonth() + server.managedAppsPricePerMonth()
    , 0

  oSSubtotal: ->
    _.reduce @models, (memo, server) ->
      memo + server.totalOSPricePerMonth()
    , 0

module.exports = ServersCollection