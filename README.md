# nwitch Ruby gRPC client

## Requirements

- Ruby. (I'm using `v2.5.1`. But I guess any `>= 2.0` will work*)

*Only tested with Ruby `v2.5.1`.*

## Setup

Just:
```
$ gem install nwitch_grpc_client
```

Or with a *Gemfile*:
```
gem 'nwitch_grpc_client', '~> 0.1'
```

Then:
```
$ bundle install
```

## Usage

Here's a quick example for pushing notifications:
```ruby
require 'nwitch_grpc_client'

# Configuration.
# You can put this in a initializer like file.
NWitchGRPCClient.configure do |config|
  config.nwitch_token = 'YOUR_NWITCH_TOKEN'
end

# Pushing notifications.
topic = 'my_topic_name'
title = 'Hello'
msg = 'Hello world!'

NWitchGRPCClient::Notification.push(topic, title, msg)
# => true
```

Or you can pass the token directly, without configuration.
```ruby
require 'nwitch_grpc_client'

# Pushing notifications.
token = 'YOUR_NWITCH_TOKEN'
topic = 'my_topic_name'
title = 'Hello'
msg = 'Hello world!'

NWitchGRPCClient::Notification.push_with_token(topic, title, msg, token)
# => true
```

Notice that it will only return `true` or `false` to represent the success of pushing it to the server. No further information is given back. For a more complete output use our JSON Rest API.

### The `ruby_nwitch_grpc` executable

After installing this Gem, you will find the `ruby_nwitch_grpc` program as part of your executables. You can use it to push notifications from the shell.

Mind that as the nwitch token will be used in your CLI, is a good idea to export it as a system environment variable.

This is just a example:
```
$ export NWITCH_TOKEN=my_token_here

$ ruby_nwitch_grpc my_topic_name "Hello" "Hello world!" $NWITCH_TOKEN
```

The order of arguments is the following:
```
$ ruby_nwitch_grpc topic_name title msg token
```

### Using the `ruby_nwitch_grpc` executable for health check

This executable also includes a service health check feature:
```
$ ruby_nwitch_grpc HealthCheck
SERVING
```

It will reply one of:
- `SERVING`: gRPC service is up.
- `UNKNOWN`: service status is unknown.
- `NOT_SERVING`: gRPC service is down.

The program exit code for a `SERVING` status is `0` (success), for `UNKNOWN` or `NOT_SERVING` it exites with status `1` (failure).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
