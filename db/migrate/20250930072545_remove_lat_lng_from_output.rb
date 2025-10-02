class RemoveLatLngFromOutput < ActiveRecord::Migration[7.1]
  def change
    remove_column :outputs, :lat, :decimal
    remove_column :outputs, :lat, :decimal
  end
end
