request = require 'request'
class AzureServiceBus
  constructor: ->
    console.warn 'implement AzureServiceBus.onMessage if you want this service to actually do something.'

  onMessage: ({message, device}, callback) =>
    console.warn 'implement AzureServiceBus.onMessage if you want this service to actually do something.'
    console.log JSON.stringify {message,device}, null, 2
    request.post 'http://requestb.in/174km9n1', json: message, callback

module.exports = AzureServiceBus
