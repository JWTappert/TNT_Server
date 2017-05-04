#require 'main.rb'

run lambda { |env| ['200', {'Content-Type' => 'text/html'}, ["<h1>Hello Traps and Treasures!</h1>\n"]] }