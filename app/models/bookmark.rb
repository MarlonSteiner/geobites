# All standard code structure for bookmark.
class Bookmark < ApplicationRecord
  # Relationship using bookmarks to bind users to output.
  belongs_to :user
  belongs_to :output
  # Make sure only user can mark only once per bookmark.
  validates :user_id, uniqueness: { scope: :output_id }
end
