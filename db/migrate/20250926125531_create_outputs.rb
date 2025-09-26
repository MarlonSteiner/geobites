class CreateOutputs < ActiveRecord::Migration[7.1]
  def change
    create_table :outputs do |t|
      t.string :city
      t.string :country
      t.decimal :lat
      t.decimal :lng
      t.text :text
      t.string :source

      t.timestamps
    end
  end
end
