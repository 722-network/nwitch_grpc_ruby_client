module NWitchGRPCClient
  class Notification
    def self.push(topic, title, msg)
      token = NWitchGRPCClient.configuration.nwitch_token
      service = self.new

      service.push(topic, title, msg, token)
    end

    def self.push_with_token(topic, title, msg, token)
      service = self.new

      service.push(topic, title, msg, token)
    end

    def initialize
      host = NWitchGRPCClient.configuration.grpc_host

      @stub = NWitchGRPC::Protobuf::Notification::Stub
        .new(host, :this_channel_is_insecure)
    end

    def push(topic, title, msg, token)
      req_params = build_req(topic, title, msg, token)
      req = @stub.push(req_params)

      req.success
    end

    private

    def build_req(topic, title, msg, token)
      NWitchGRPC::Protobuf::PushRequest.new(
        nwitch_token: token,
        topic_name: topic,
        title: title,
        message: msg
      )
    end
  end
end
