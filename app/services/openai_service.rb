# Code structure was copy, pasted and modified.
class OpenaiService
  def self.generate_fact(city, country)
    client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])

    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [
          { role: "user", content: "Give me one interesting fact about #{city}, #{country} in 1-2 sentences, under 35 words." }
        ],
        max_tokens: 60
      }
    )

    response.dig("choices", 0, "message", "content")
  rescue => e
    "Unable to generate fact. Please try another location."
  end
end
