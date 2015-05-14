# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(nom: 'Dupont', prenom: 'Robert', email: 'jambon@patate.fr', approved: 'true', type: 'Administrateur', role: 'prof', password: 'M1234n56789')
Annonce.create!(entreprise: 'jocorps.', titre: 'vente de poulet', genre: 'arnaque', description: 'shut up and take my money', duree: '3jours', datedebut: '01/01/1995', moyencontact: 'pigeon voyageur', etat: 'true', validee: 'true')

User.create!(nom: 'leboss', prenom: 'pedro', email: 'pola@patate.fr', approved: 'true', type: 'Eleve', role: 'sousfifre', password: 'lovelove')
