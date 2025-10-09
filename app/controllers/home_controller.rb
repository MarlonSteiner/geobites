class HomeController < ApplicationController
  def index
  end

  def select
    # Make the country and city variables
    country = params[:country]
    city = params[:city]
    # Create output variable and use OpenAI service
    output = OpenaiService.generate_fact(city, country)
  end
end
