require 'faker'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# path = Dir[File.join(File.dirname(__FILE__), "/drugs.json")]
# file = File.open(path)
# p file
# # data = JSON.parse(file)
# # p data
OrderedDrug.destroy_all
Drug.destroy_all
Order.destroy_all
Pharmacy.destroy_all
User.destroy_all
data = JSON.parse(File.read(Rails.root.join('db/drugs.json')))

data.each do |drug|
  Drug.create!(name: drug['name'],
               description: drug['description'],
               prescribed: false)
end
customer = User.create({ first_name: 'Mike', last_name: 'Jones', email: 'mike@hello.com', password: '123456' })
pharmacy = Pharmacy.create({ name: 'Pharm', address: '123 hello', description: 'very nice', user: customer})
drug = Drug.create({ name: 'drug', prescribed: false })
order = Order.create({ user: customer, total: 45.3, pharmacy: pharmacy, status: 'pending', accepted: false })
ordered_drug = OrderedDrug.create({ order: order, price: 10, quantity: 2, drug: drug })

Drug.create!([{ name: 'Smecta',
                description: 'to vomit in complete serenity',
                prescribed: false },
              { name: 'lurofene',
                description: 'to be like a titan all night long !',
                prescribed: true }])
