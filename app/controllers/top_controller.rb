class TopController < ApplicationController
  def index
    @keywords = Keyword.select('word').group("word").count.sort {|(k1, v1), (k2, v2)| v2 <=> v1 }.first(10)
  end
end
