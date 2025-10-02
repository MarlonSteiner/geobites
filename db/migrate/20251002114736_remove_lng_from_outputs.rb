class RemoveLngFromOutputs < ActiveRecord::Migration[7.1]
  def change
    remove_column :outputs, :lng, :decimal
  end
end
