class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :brand
      t.integer :storage
      t.float :unit_price

      t.timestamps
    end
  end
end
