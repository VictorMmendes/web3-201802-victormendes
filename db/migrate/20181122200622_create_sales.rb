class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.integer :amount
      t.float :unit_price
      t.float :total_price
      t.datetime :date
      t.references :employee, foreign_key: true
      t.references :client, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
