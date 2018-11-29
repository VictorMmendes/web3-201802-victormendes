class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.date :birthdate
      t.string :cpf
      t.string :cnpj
      t.string :address

      t.timestamps
    end
  end
end
