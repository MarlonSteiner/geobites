class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:select]

  def index
  end

  def select
    # Make the country and city variables
    country = params[:country]
    city = params[:city]
    # Create output variable and use OpenAI service
    output = OpenaiService.generate_fact(city, country)
    # Kept making the mistake rendering an instance...
    render json: { output: output }
  end
end
