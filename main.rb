#! /usr/bin/env ruby
# Justin Tappert
# Simple service for web app synch

require 'rack'
require 'sinatra'
require 'pusher'
require 'redis'
''
$redis = Redis.new(url: "redis://h:p0eb2bdfea2e7eb3b211f8b0d8ac7c12f3d9e359e175e2fe8715994401ba7ccb6@ec2-34-203-180-66.compute-1.amazonaws.com:29849")

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
  player = $redis.get('playerId') || 0
	location = $redis.get('locationId') || 0
	pusher_client.trigger('my-channel', 'my-event', {
    message: "Player id: #{player}, location id: #{location}"
  })
  "Message sent to subscribers"
end

get '/:player_id/move/:location_id' do
	$redis.set('playerId', params[:player_id])
	$redis.set('locationId', params[:location_id])
end