class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :cpf
      t.string :rg
      t.string :work_permit
      t.date :hiring
      t.date :birthdate
      t.float :salary
      t.string :address

      t.timestamps
    end
  end
end
