require 'clockwork'

require './config/boot'
require './config/environment'

module Clockwork
    handler do |job|
        puts "Running #{job}"
    end

    every(20.seconds, 'rake "newsletter:send"')
end
