# Code structure was copy, pasted from the Openai docs then modified.
class OpenaiService
  def self.generate_fact(city, country)
    puts "API Key present: #{ENV['OPENAI_ACCESS_TOKEN'].present?}"
    puts "API Key length: #{ENV['OPENAI_ACCESS_TOKEN']&.length}"
    # client = OpenAI::Client.new(access_token: ENV['OPENAI_ACCESS_TOKEN'])
    #  https://github.com/alexrudall/ruby-openai
    # This was the only way and fastest way I found to disable SSL_verification. I have a lot of MacOs webfilters which get in the way of coding. I don't always want to turn them off so I just disabled SSL_verification.
    client = OpenAI::Client.new(
      access_token: ENV['OPENAI_ACCESS_TOKEN'],
      request_timeout: 240,
      ssl_verify: false
    )

    response = client.chat(
      parameters: {
        # Using the gpt-4o model
        model: "gpt-4o",
        messages: [
          # 100-150 words to save money.
          { role: "user", content: "Give me one suprisingly fun interesting fact about #{city} in #{country} in between 100 - 150 words. No starting with a greeting or saying the city first. If the city is unknown then just write about the country in general. Make sure to complete the sentence." }
        ],
        max_tokens: 60
      }
    )

    response.dig("choices", 0, "message", "content")

  # This block goes through when there is an issue with the API call
  rescue => e
    # Message displayed when there is an error "e"
    "Unable to generate fact. Please try another location."
  end
end
