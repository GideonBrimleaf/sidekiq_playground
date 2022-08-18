require 'rufus-scheduler'
require_relative 'worker'

scheduler = Rufus::Scheduler.new

scheduler.every '1s' do
  puts 'Adding to Queue'
  Worker.perform_async("super_hard")
end

scheduler.join