require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require_relative "twilio.rb"
require_relative "fbscrape.rb"


class Message
  def initialize(body)
    @body = body
    @number_list = []
    numbers_list
  end

  #create a method to handle opening and parsing through numbers.txt
  #File.open to open the file
  #save the contents as a variable and then trigger the send_text

  def numbers_list
    numbers = File.open("numbers.txt") do |file|
      while line = file.gets
        @number_list << line
      end
    end
  end
  # put your own credentials here



  # set up a client to talk to the Twilio REST API
 

  def send_text
    @number_list.each do |number|
      # clock = Alarm.new(2014, 07, 17, 11, 38, 40)
      puts Time.now
      account_sid = 'ACe330ba04d082392df4cb3511dcb72cec'
      auth_token = '2008ea097713e401a16c54029058da82'
      @client = Twilio::REST::Client.new account_sid, auth_token
      # until Time.now > clock.time
      #   puts "It's not time!"
      #   sleep (5)
      # end
      @client.account.messages.create(
      :from => '+18152642023',
      :to => number,
      :body => @body
      )
    end
  end

  # def send_joke_text
  #   joke = Jokes.new
  #   text = Message.new("+1#{@to}", jokereturn)
  #   text.send_text
  # end


  

end