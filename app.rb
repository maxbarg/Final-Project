require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require 'pry'
require './lib/fbscrape.rb'
require './lib/messagesend.rb'
require 'mechanize'


get '/' do
  erb :index
end

post '/' do
  # joke = Jokes.new
  # jokereturn = joke.country_jokes(72)
  # text = Message.new("+1#{number}", jokereturn)
  # text.send_text
  numbers = File.open("numbers.txt", "a+") {|f| f.print "#{params[:number]}\n" }
  # numbers.write(params[:number] + "\n")
  erb :index
end