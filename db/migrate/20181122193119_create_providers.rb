class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :fancy_name
      t.string :cnpj
      t.string :cpf
      t.date :register_date
      t.string :address

      t.timestamps
    end
  end
end
