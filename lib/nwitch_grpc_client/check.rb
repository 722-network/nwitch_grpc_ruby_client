module NWitchGRPCClient
  class Check
    def self.check
      service = self.new
      service.check
    end

    def initialize
      host = NWitchGRPCClient.configuration.grpc_host

      @stub = NWitchGRPC::Protobuf::Health::Stub
        .new(host, :this_channel_is_insecure)
    end

    def check
      req = @stub.check(build_req)

      req.status
    end

    private

    def build_req
      NWitchGRPC::Protobuf::HealthCheckRequest.new(service: 'nwitch')
    end
  end
end
