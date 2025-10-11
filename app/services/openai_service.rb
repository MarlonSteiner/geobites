# Code structure was copy, pasted and modified.
class OpenaiService
  def self.generate_fact(city, country)
    puts "API Key present: #{ENV['OPENAI_ACCESS_TOKEN'].present?}"
    puts "API Key length: #{ENV['OPENAI_ACCESS_TOKEN']&.length}"
    client = OpenAI::Client.new(access_token: ENV['OPENAI_ACCESS_TOKEN'])

    response = client.chat(
      parameters: {
        # Using the gpt-4o model
        model: "gpt-4o",
        messages: [
          { role: "user", content: "Give me one suprisingly fun interesting fact about #{city} in #{country} in under 100 words in the reflective style of Socrates. Make it sound fun, not formal. No starting with a greetings. If the city is unknown then just write about the country in general." }
        ],
        max_tokens: 60
      }
    )

    response.dig("choices", 0, "message", "content")
  rescue => e
    puts "OpenAI error"
    "Unable to generate fact. Please try another location."
  end
end
