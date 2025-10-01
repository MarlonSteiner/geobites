class RemoveLatLngFromOutput < ActiveRecord::Migration[7.1]
  def change
    remove_column :output, :lat, :decimal
    remove_column :output, :lat, :decimal
  end
end
