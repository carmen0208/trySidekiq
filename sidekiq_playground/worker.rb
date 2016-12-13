require 'sidekiq'

# We'll configure the Sidekiq client to connect to Redis using a custom
# DB - this way we can run multiple apps on the same Redis without them
# stepping on each other

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

# We'll configure the Sidekiq server as well

Sidekiq.configure_server do |config|
  config.redis = { db: 1 }
end

# We'll make a new Worker class, including Sidekiq::Worker

class OurWorker
  include Sidekiq::Worker

  sidekiq_options retry: 0

  def perform(complexity)
    case complexity
    when "super_hard"
      puts "charging a credit card"
     # raise "Woops stuff got bad"
      sleep 20
      puts "Really took quite a bit of effort"
    when "hard"
      sleep 10
      puts "That was a bit of work"
    else
      # while true do
        sleep 1
        puts 'Bugs! I will loop forever!'
      # end
      # sleep 1
      puts "That wasn't a lot of effort"
    end
  end
end
