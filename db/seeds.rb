require 'faker'
require 'cpf_utils'

puts "Criando 5 clients"
5.times do
  Client.create! name: Faker::FunnyName.unique.name, phone: Faker::PhoneNumber.cell_phone, email: Faker::Internet.unique.email, birthdate: Faker::Date.birthday(18, 65), cpf: CpfUtils.cpf_formatted, cnpj: CpfUtils.cpf, address: Faker::Address.unique.street_address
end

puts "Criando 5 Providers"
5.times do
  Provider.create! name: Faker::Movies::StarWars.character, phone: Faker::PhoneNumber.cell_phone, email: Faker::Internet.unique.email, fancy_name: Faker::Company.unique.name, cnpj: CpfUtils.cpf, cpf: CpfUtils.cpf_formatted, register_date: Faker::Date.birthday(25, 150), address: Faker::Address.unique.street_address
end

puts "Criando 5 Employees"
5.times do
  Employee.create! name: Faker::FunnyName.unique.name, phone: Faker::PhoneNumber.cell_phone, email: Faker::Internet.unique.email, cpf: CpfUtils.cpf_formatted, rg: CpfUtils.cpf, work_permit: CpfUtils.cpf, hiring: Faker::Date.birthday(1, 10), birthdate: Faker::Date.birthday(16, 42), salary: Faker::Number.decimal(4,2), address: Faker::Address.unique.street_address
end

puts "Criando 5 items"
Item.create! name: "Leite", brand: "Tirol", storage: 0, unit_price: 2.75
Item.create! name: "Margarina", brand: "Qualy", storage: 0, unit_price: 4.25
Item.create! name: "Achocolatado", brand: "Nescau", storage: 0, unit_price: 6.49
Item.create! name: "Café Solúvel", brand: "Nescafé", storage: 0, unit_price: 7.15
Item.create! name: "Requeijão", brand: "Sadia", storage: 0, unit_price: 3.90

puts "Criando 1 usuário"
password = Faker::Color.hex_color
User.create! name: Faker::FunnyName.unique.name, email: Faker::Internet.unique.email, password: password, password_confirmation: password
