# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: push.proto

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "NWitchGRPC.Protobuf.PushRequest" do
    optional :nwitch_token, :string, 1
    optional :topic_name, :string, 2
    optional :title, :string, 3
    optional :message, :string, 4
  end
  add_message "NWitchGRPC.Protobuf.PushResponse" do
    optional :success, :bool, 1
  end
end

module NWitchGRPC
  module Protobuf
    PushRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("NWitchGRPC.Protobuf.PushRequest").msgclass
    PushResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("NWitchGRPC.Protobuf.PushResponse").msgclass
  end
end
