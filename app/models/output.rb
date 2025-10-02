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
end
