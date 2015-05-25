require 'clockwork'

require './config/boot'
require './config/environment'

module Clockwork
    handler do |job|
        puts "Running #{job}"
    end

    every(1.minutes, 'rake "newsletter:send"')
end
