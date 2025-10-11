class Output < ApplicationRecord
  # Standard bookmark model relationship setup
  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks

  # Make sure all needed information is there before saving in the database
  validates :city, :country, :latitude, :longitude, :text, presence: true

  # Geocoding docs
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_city?
end
