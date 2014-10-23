class WelcomeController < ApplicationController
  def index
    Viewer.create(:ip => request.remote_ip)
  end
end
