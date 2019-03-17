module NWitchGRPCClient
  class Configuration
    attr_accessor :grpc_host, :nwitch_token

    def initialize
      @grpc_host = 'localhost:50051'
      @nwitch_token = ''
    end
  end
end
