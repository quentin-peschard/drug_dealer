# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Drug.create!([
                    {
                        name: "Smecta", 
                        description: "to vomit in complete serenity", 
                        prescripted: false
                    }, 
                    {
                        name: "lurofene",
                        description: "to be like a titan all night long !",
                        prescripted: true
                    }
])