azure = require 'azure'
debug = require('debug')('data-forwarder-azure-service-bus')
class AzureServiceBus
  onMessage: ({message, device}, callback) =>
    {connectionString, queueName} = device
    debug {connectionString, queueName}
    serviceBusService = azure.createServiceBusService connectionString
    serviceBusService.sendQueueMessage queueName, body: JSON.stringify(message), (error, response) =>
      debug {error, response}
      callback error

module.exports = AzureServiceBus
