class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:select]

  def index
  end

  def select
    # Make the country and city variables
    country = params[:country]
    city = params[:city]
    latitude = params[:latitude]
    longitude = params[:longitude]

    # Create output variable and use OpenAI service
    output = OpenaiService.generate_fact(city, country)

    # Output instance which is the easiest way I know to store and send a hash of data
    @output = Output.create( city: city, country: country, text: output, latitude: latitude, longitude: longitude )

    # Error handling time
    if @output.persisted?
      puts "Output saved successfully! ID: #{@output.id}"
    else
      puts "output failed to save"
      puts "Errors: #{@output.errors.full_messages}"
    end

    # Kept making the mistake rendering an instance...
    # We are sending back both the text & output_id
    render json: { output: output, output_id: @output.id }
  end
end
