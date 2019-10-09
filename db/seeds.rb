# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

channels = Channel.create([
	{ name: 'SVT1' }, 
	{ name: 'SVT2' }, 
	{ name: 'TV3' }, 
	{ name: 'TV4' }
])

programs = Program.create([
	{ title: 'Rapport', start: "2019-10-09 20:00:00", stop: "2019-10-09 21:00:00", live: false, channel_id: 1},
	{title: 'Morgonsoffan', live: true, channel_id: 1}
])