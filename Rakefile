require 'rubygems'
require 'mechanize'
require 'open-uri'
require 'nokogiri'
require 'pry'
require 'twilio-ruby'
require_relative "./lib/fbscrape.rb"
require_relative "./lib/messagesend.rb"

task :senddaily do 

  #create an instance of your messaging class
  #call the send text method on that instance

  joke = Jokes.new
  start = 56
  amount = 3
  start.upto(start+amount-1) do |x|
    jokereturn = x.even? ? joke.country_jokes(x) : joke.mama_jokes(x)
    if jokereturn.length >= 1600
      next
    end
    text = Message.new(jokereturn)
    text.send_text
  end
end