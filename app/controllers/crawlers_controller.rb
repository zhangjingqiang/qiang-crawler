class CrawlersController < ApplicationController
  before_action :set_keyword, :except => [:search, :top, :page_rank]
  
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
  
  def search
    session['keyword'] = params[:s]
    Keyword.create(:word => params[:s]) if params[:s] != ''
    redirect_to request.env["HTTP_REFERER"]
  end

  def top
    @keywords = Keyword.select('word').group("word").count.sort {|(k1, v1), (k2, v2)| v2 <=> v1 }.first(10)
  end

  def page_rank
    target_url = URI.parse(request.original_url).host
    @backlinks = PageRankr.backlinks(target_url, :google, :bing, :yahoo, :alexa)
    @indexes = PageRankr.indexes(target_url, :google, :bing, :yahoo)
    @ranks = PageRankr.ranks(target_url, :alexa_us, :alexa_global, :google, :moz_rank, :page_authority)
  end
  
  private
  
  def set_keyword
    @keyword = (!session['keyword'].nil? && session['keyword'] != '')? session['keyword'] : 'barackobama'
  end
end
