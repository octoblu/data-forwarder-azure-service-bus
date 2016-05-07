azure = require 'azure'
debug = require('debug')('data-forwarder-azure-service-bus')
class AzureServiceBus
  onMessage: ({message, device}, callback) =>
    {connectionString, queueName} = device
    serviceBusService = azure.createServiceBusService connectionString
    serviceBusService.sendQueueMessage queueName, body: JSON.stringify(message), callback

module.exports = AzureServiceBus
