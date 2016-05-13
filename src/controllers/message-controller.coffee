debug       = require('debug')('data-forwarder:data-forwarder-azure-service-bus')
_           = require 'lodash'
MeshbluHttp = require 'meshblu-http'
AzureServiceBus  = require '../models/azure-service-bus-model'

class MessageController

  message: (req, res) =>
    message = req.body
    meshblu = new MeshbluHttp req.meshbluAuth
    @getDeviceConfig meshblu, (error, device) =>
      return res.sendError(error) if error?
      {forwarderConfig} = device
      return res.sendStatus 422 unless forwarderConfig?
      azureServiceBus = new AzureServiceBus
      azureServiceBus.onMessage {message, forwarderConfig}, (error) =>
        return res.sendError error if error?
        res.sendStatus 201

  getDeviceConfig: (meshblu, callback) =>
    meshblu.whoami (error, device) =>
      return callback error if error?
      callback null, device

module.exports = MessageController
