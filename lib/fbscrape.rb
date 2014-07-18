require 'rubygems'
require 'mechanize'
require 'open-uri'
require 'nokogiri'
require 'pry'

agent = Mechanize.new


# page = agent.get('http://jokes.cc.com/')

# html = page.body

class Jokes

  def initialize
    # @x = 0
    jokes_html = open('http://jokes.cc.com/')
    @jokes_doc = Nokogiri::HTML(open('http://jokes.cc.com/'))
    # while @x < 6
    #   if @x.even?
    #     @country_joke_text = self.country_jokes
    #     @country_joke_text
    #   else
    #     @mama_joke_text = self.mama_jokes
    #     @mama_joke_text
    #   end
    #   @x += 1
    # end
  end

  # def joke_maker
  #   while @x < 2 && @y < 2
  #    country_jokes
  #     sleep (5)
  #     mama_jokes
  #     @x += 1
  #     @y += 1
  #   end
  # end


  def country_jokes(x)
    countryjokes = @jokes_doc.css(".country_jokes a")[0]['href']
    countryjokes_html = open(countryjokes)
    countryjokes_doc = Nokogiri::HTML(countryjokes_html)
    countryjokes_list = countryjokes_doc.css(".middle ul")[4]
    countryjokes_links = countryjokes_list.css("a")[x]['href']
    joke_x_html = open(countryjokes_list.css("a")[x]['href'])
    joke_x_doc = Nokogiri::HTML(joke_x_html)
    joke_x = joke_x_doc.css(".content_wrap p").text.to_s
    "#{x.to_i + 1} : #{joke_x}"
  end

  def mama_jokes(x)
    
    mamajokes = @jokes_doc.css(".yo_mama a")[0]['href']
    mamajokes_html = open(mamajokes)
    mamajokes_doc = Nokogiri::HTML(mamajokes_html)
    mamajokes_list = mamajokes_doc.css(".middle ul")[4]
    mamajokes_links = mamajokes_list.css("a")[x]['href']
    joke_y_html = open(mamajokes_list.css("a")[x]['href'])
    joke_y_doc = Nokogiri::HTML(joke_y_html)
    joke_y = joke_y_doc.css(".content_wrap p").text.to_s
    "#{x.to_i + 1} : #{joke_y}"
  end

end

 

#binding.pry

#dark humor monday
#blonde friday
#god sunday
#sports satruday



#get scraping OO working
#in your send text method -- create a new instance of your joke, and set the body of your text = whatever joke you want
#

#"#{x.to_i + 1}" + ":" + " " + 