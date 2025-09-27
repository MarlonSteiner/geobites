class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :output

  validates :user_id, uniqueness: { scope: :output_id }
end
