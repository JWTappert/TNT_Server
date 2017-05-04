#! /usr/bin/env ruby
# Justin Tappert
# Simple service for web app synch

require 'rack'

app = Proc.new do |env|
	['200', {'Content-Type' => 'text/html'}, ["<h1>Hello Traps and Treasures!</h1>\n"]]
end

Rack::Handler::WEBrick.run(app)

