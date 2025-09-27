class Output < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks

  validates :city, :country, :lat, :lng, :text, presence: true
end
