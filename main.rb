#! /usr/bin/env ruby
# Justin Tappert
# Simple service for web app synch

require 'rack'
require 'sinatra'
require 'pusher'
require 'redis'

redis = Redis.new

pusher_client = Pusher::Client.new(
  app_id: '341326',
  key: 'db261505a706dda1d8ef',
  secret: 'a0b9d1b0116444af68c5',
  cluster: 'us2',
  encrypted: true
)



get '/' do 
	'Hello World!!'
end

get '/player' do
  pusher_client.trigger('my-channel', 'my-event', {
    message: 'hello world'
  })
end