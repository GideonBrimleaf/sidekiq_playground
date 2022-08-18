require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = {db: 1}
end

Sidekiq.configure_server do |config|
  config.redis = {db: 1}
end

class Worker
  include Sidekiq::Worker

  def perform(complexity)
    case complexity
    when "super_hard"
      # sleep 10
      # raise "whoops, stuff got bad"
      sleep 20
      puts "That was super hard"
    when "hard"
      sleep 10
      puts "That was reasonably hard"
    else

      sleep 1
      puts "Meh, that was fine"
    end
  end
end
