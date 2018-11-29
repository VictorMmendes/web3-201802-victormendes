class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :amount
      t.float :unit_price
      t.float :total_price
      t.datetime :date
      t.references :employee, foreign_key: true
      t.references :provider, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
