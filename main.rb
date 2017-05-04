#! /usr/bin/env ruby
# Justin Tappert
# Simple service for web app synch

require 'rack'

app = Proc.new do |env|
	['200', {'Content-Type' => 'text/html'}, ["Hello Traps and Treasures!\n"]]
end

Rack::Handler::WEBrick.run(app)

