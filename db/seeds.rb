# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer = User.create({first_name: 'Mike', last_name: 'Jones', email: 'mike@hello.com', password: '123456' })
pharmacy = Pharmacy.create({name: 'Pharm', address: '123 hello', description: 'very nice', user_id: 1 })
drug = Drug.create({name: 'drug', prescribed: false})
order = Order.create({user_id: 1, total: 45.3, pharmacy_id: 1, status: 'pending', accepted: false})
ordered_drug = OrderedDrug.create({order_id: 1, price: 10, quantity: 2, drug_id: 1})
