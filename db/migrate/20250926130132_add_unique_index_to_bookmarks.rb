# Prevents users bookmarking the same output more than once
class AddUniqueIndexToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_index :bookmarks, %i[user_id output_id], unique: true
  end
end
