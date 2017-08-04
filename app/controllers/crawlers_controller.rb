class CrawlersController < ApplicationController
  before_action :set_keyword

  def google
    escaped_url = URI.escape("https://www.google.com/search?q=#{@keyword}&oe=utf-8&hl=en")
    @doc = Nokogiri::HTML(open(escaped_url))
  end

  def facebook
    begin
      response = open("http://graph.facebook.com/#{@keyword}").read
      @json = JSON.parse(response)
    rescue
    end
  end

  def twitter
    @doc = Nokogiri.HTML(open("https://twitter.com/search?f=realtime&q=#{URI.encode(@keyword)}&src=typd"))
  end

  def flickr
    @doc = Nokogiri::HTML(open("https://www.flickr.com/search/?q=#{URI.encode(@keyword)}"))
  end

  def youtube
    url = "http://www.youtube.com/results?search_query=#{URI.encode(@keyword)}"
    doc = Nokogiri::HTML(open (url))

    @urls = []
    elements= doc.xpath("//h3[@class='yt-lockup-title']/a")
    elements.each do |a|
      code = a.attributes['href'].value
      @urls << "http://www.youtube.com" + code if code.include?('watch')
    end
  end

  def amazon
    url= "http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=#{URI.encode(@keyword)}"
    doc = Nokogiri::HTML(open(url))

    @doc = []
    doc.xpath("//h3[@class='newaps']/a").each {|item|
      asin = item[:href].match(%r{dp/(.+)})[1]
      url="http://www.amazon.com/dp/#{asin}"
      @doc << Nokogiri::HTML(open(url)) rescue nil
    }
  end

  private

  def set_keyword
    @keyword = (!session['keyword'].nil? && session['keyword'] != '')? session['keyword'] : 'rails'
  end
end
