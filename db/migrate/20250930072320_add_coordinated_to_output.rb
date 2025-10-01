class AddCoordinatedToOutput < ActiveRecord::Migration[7.1]
  def change
    add_column :outputs, :latitude, :float
    add_column :outputs, :longitude, :float
  end
end
