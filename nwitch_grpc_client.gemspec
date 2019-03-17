
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nwitch_grpc_client/version"

Gem::Specification.new do |spec|
  spec.name          = "nwitch_grpc_client"
  spec.version       = NWitchGRPCClient::VERSION
  spec.authors       = ["Fernando Schuindt"]
  spec.email         = ["fschuindt@722.network"]

  spec.summary       = %q{A Ruby gRPC client for nwitch.}
  spec.description   = %q{Acts as a Ruby gem for the nwitch gRPC proxy.}
  spec.homepage      = "https://github.com/722-network/nwitch_grpc_ruby_client"
  spec.license       = "MIT"

  spec.files = [
    'lib/nwitch_grpc_client.rb',
    'lib/nwitch_grpc_client/configuration.rb',
    'lib/nwitch_grpc_client/check.rb',
    'lib/nwitch_grpc_client/notification.rb',
    'lib/nwitch_grpc_client/version.rb',
    'lib/nwitch_grpc_client/protobuf/check_pb.rb',
    'lib/nwitch_grpc_client/protobuf/check_services_pb.rb',
    'lib/nwitch_grpc_client/protobuf/push_pb.rb',
    'lib/nwitch_grpc_client/protobuf/push_services_pb.rb'
  ]

  spec.bindir        = "bin"
  spec.executables   = ["ruby_nwitch_grpc"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "google-protobuf", "~> 3.7"
  spec.add_dependency "grpc", "~> 1.19"
end
