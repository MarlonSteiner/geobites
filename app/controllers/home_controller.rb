class HomeController < ApplicationController
  # Country and City are converted to instances so we are able to add them in prompting
  def index
    @country = session[:country]
    @city = session[:country]
  end

  # We save Country and City to session if they are chosen
  def select
    session[:city] = params[:country].presence
    session[:country] = params[:city].presence
  end
end
