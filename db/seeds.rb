# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Message.delete_all
Topic.delete_all

pockemons_topic = Topic.create( title: 'Pockemon')
pikachu = Message.create(topic: pockemons_topic, content: 'Pikachu is the power!!!')
psyduck = Message.create(topic: pockemons_topic, content: 'Psyduck is the power!!! He has a beak!!!')

cars_topic = Topic.create( title: 'Cars')
nissan = Message.create(topic: cars_topic, content: 'Nissan is the power!!!')
delica = Message.create(topic: cars_topic, content: 'Delica is the power!!! Salmon up, nissan owner!!!')