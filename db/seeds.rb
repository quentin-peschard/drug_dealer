require 'faker'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# path = Dir[File.join(File.dirname(__FILE__), "/drugs.json")]
# file = File.open(path)
# p file
# # data = JSON.parse(file)
# # p data
data = JSON.parse(File.read(Rails.root.join('db/drugs.json')))

data.each do |drug|
    Drug.create!(
        name: drug["drug_name"],
        description: drug["description"],
        prescripted: false
    )
end
