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

puts 'Destroying everything...'

data = JSON.parse(File.read(Rails.root.join('db/drugs.json')))

puts 'Getting Data...'

data.each do |drug|
  new_drug = Drug.create!(name: drug['name'],
               description: drug['description'],
               prescribed: false)
  if drug['pic']
    file = URI.open(drug['pic'])
    new_drug.pic.attach(io: file,filename: "#{new_drug.name}.png", content_type: 'image/png')
  else
    img src="https://raw.githubusercontent.com/lewagon/fullstack-images/master/uikit/greece.jpg"
  end
end

puts 'Creating users...'

customer = User.create({ first_name: 'Mike', last_name: 'Jones', email: 'mike@hello.com', password: '123456' })
pharmacist = User.create({ first_name: 'Michel', last_name: 'Drucker', email: 'michel@hello.com', password: '123456' })
pharmacy = Pharmacy.create({ name: 'Pharmacie du Wagon',
                             address: '14 villa Gaudelet, 75011 Paris',
                             user: pharmacist,
                             description: 'Surprisingly not a pharmacy, nice people are studying here though' })

puts 'Creating pharmacies...'

Pharmacy.create!([{ name: 'Pharmacie Saint Honoré',
                    description: 'Une très belle Pharmacie et même la plus belle de Paris',
                    address: '115 Rue St Honoré, 75001 Paris',
                    user: pharmacist },
                  { name: 'Pharmacie Montorgueil',
                    description: 'Tout est présent pour rendre notre visite la plus agréable dans cette pharmacie.',
                    address: '67 Rue Montorgueil, 75002 Paris',
                    user: pharmacist },
                  { name: 'Pharmacie de Bretagne',
                    description: 'Un accueil toujours chaleureux et humain, des conseils appropriés.',
                    address: '10 Rue de Bretagne, 75003 Paris',
                    user: pharmacist },
                  { name: "Pharmacie de l'Île Saint-Louis",
                    description: 'Non contents d’être trois fois plus cher, ils sont fort désagréables.',
                    address: '8 Rue Jean du Bellay, 75004 Paris',
                    user: pharmacist },
                  { name: 'Pharmacie Monge Notre Dame',
                    description: 'La pharmacie est grande et on en trouve de tout et à de très bons prix.',
                    address: '1 Place Monge, 75005 Paris',
                    user: pharmacist },
                  { name: 'Pharmacie Bader',
                    description: "Cette pharmacie propose une grande variété d'articles et les prix sont moins chers.",
                    address: '12 Boulevard Saint-Michel, 75006 Paris',
                    user: pharmacist },
                  { name: 'Pharmacie Saint Dominique',
                    description: 'Hospitalité, et professionnalisme au rendez-vous, pharmacie très agréable.',
                    address: '88 Rue Saint-Dominique, 75007 Paris',
                    user: pharmacist },
                  { name: 'Pharmacie des Arts Elysées',
                    description: 'Quelle équipe formidable avec des compétences et une organisation irréprochables !',
                    address: '27 Rue de Miromesnil, 75008 Paris',
                    user: pharmacist },
                  { name: 'Pharmacie Internationale de Paris',
                    description: "Une très belle pharmacie avec beaucoup de choix, l'équipe est professionnelle.",
                    address: '17 Boulevard de Rochechouart, 75009 Paris',
                    user: pharmacist },
                  { name: 'Pharmacie Parodi',
                    description: 'Une équipe au top qui prend le temps de conseiller au mieux ses clients.',
                    address: '222 Rue du Faubourg Saint-Martin, 75010 Paris',
                    user: pharmacist },
                  { name: 'Pharmacie Voltaire Nation',
                    description: 'Une pharmacie de quartier très convivial. Toujours à l’écoute.',
                    address: '264 Boulevard Voltaire, 75011 Paris',
                    user: pharmacist },
                  { name: 'Grande Pharmacie Daumesnil',
                    description: 'Pharmacie professionnelle et compétente, avec une excellente gamme de produits.',
                    address: '6 Place Félix Eboué, 75012 Paris',
                    user: pharmacist },
                  { name: 'Pharmacie Centrale Paris 13',
                    description: 'Pharmacie très accueillante. Personnel compétent. De bons conseils.',
                    address: '75 Rue de Tolbiac, 75013 Paris',
                    user: pharmacist },
                  { name: 'La Grande Pharmacie d’Alésia',
                    description: 'Pharmacie certes petite mais avec des personnes très gentille.',
                    address: '79 Avenue du Général Leclerc, 75014 Paris',
                    user: pharmacist },
                  { name: 'La Grande Pharmacie du 15',
                    description: 'Magasin sur 2 étage, organisé comme un supermarché mais dédié à la parapharmacie.',
                    address: '119 Rue St Charles, 75015 Paris',
                    user: pharmacist },
                  { name: "Grande Pharmacie d'Auteuil",
                    description: 'Personnel d’une efficacité redoutable, grande diversité de produits.',
                    address: '4 Rue Poussin, 75016 Paris',
                    user: pharmacist },
                  { name: 'Pharmacie de la Rotonde',
                    description: 'Pharmacie super serviable. Réalise test AG et PCR.',
                    address: '1 Rue de Phalsbourg, 75017 Paris',
                    user: pharmacist },
                  { name: 'Grande Pharmacie Marcadet',
                    description: 'Très bon accueil. Bienveillance, professionnalisme et efficacité.',
                    address: '141 Rue Marcadet, 75018 Paris',
                    user: pharmacist },
                  { name: 'Pharmacie Secretan',
                    description: 'Excellente pharmacie, ouverte tous les jours , un véritable service constant.',
                    address: '19 Avenue Secrétan, 75019 Paris',
                    user: pharmacist },
                  { name: 'Pharmacie du 20e',
                    description: 'Super équipe et bonne réactivité des personnes en charge des commandes.',
                    address: '144 Boulevard de Ménilmontant, 75020 Paris',
                    user: pharmacist }])

puts 'Done !'
