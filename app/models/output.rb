class Output < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks

  validates :city, :country, :latitude, :longitude, :text, presence: true
  # Geocoding docs
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_city?
  # Combine city and country
  def address
    "#{city}, #{country}"
  end
  # Output prompting template from LeWagon Docs
  def content
    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: [{ role: "user", content: "You are GeoBites. Be concise, factual, and avoid unverified claims."}]
    })
    return chatgpt_response["choices"][0]["message"]["content"]
end
