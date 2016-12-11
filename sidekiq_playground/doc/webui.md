## Gemfile
```ruby
gem 'rack'
gem 'sinatra'
```

## config.ru

```ruby
require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

require 'sidekiq/web'
run Sidekiq::Web
```

## Running

```sh
rackup
```

http://0.0.0.0:9292

