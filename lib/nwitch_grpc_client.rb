require 'google/protobuf'
require 'grpc'

require 'nwitch_grpc_client/configuration'
require 'nwitch_grpc_client/notification'
require 'nwitch_grpc_client/version'
require 'nwitch_grpc_client/protobuf/push_pb'
require 'nwitch_grpc_client/protobuf/push_services_pb'

module NWitchGRPCClient
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield configuration
  end
end
