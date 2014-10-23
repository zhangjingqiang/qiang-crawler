class SearchController < ApplicationController
  def index
    session['keyword'] = params[:s]
    Keyword.create(:word => params[:s], :ip => request.remote_ip) if params[:s] != ''
    redirect_to request.env["HTTP_REFERER"]
  end
end
