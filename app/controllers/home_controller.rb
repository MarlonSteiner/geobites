class HomeController < ApplicationController
  def index
    @country = session[:country]
    @city = session[:country]
  end
end
