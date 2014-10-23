class PageRankController < ApplicationController
  def index
    target_url = URI.parse(request.original_url).host
    @backlinks = PageRankr.backlinks(target_url, :google, :bing, :yahoo, :alexa)
    @indexes = PageRankr.indexes(target_url, :google, :bing, :yahoo)
    @ranks = PageRankr.ranks(target_url, :alexa_us, :alexa_global, :google, :moz_rank, :page_authority)
  end
end
