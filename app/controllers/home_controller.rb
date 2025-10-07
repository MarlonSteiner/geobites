class HomeController < ApplicationController
  def index
  end

  def select
    country = session[:country]
    city = session[:city]
  end
end
