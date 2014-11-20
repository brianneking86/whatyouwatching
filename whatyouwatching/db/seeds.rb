# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Users
user1 = Users.create(u_id: '228277', name: 'Rebecca Cooper', picture:'rebecca_cooper_index.jpg')
user2 = Users.create(u_id: '480357', name: 'Chelsea Guster', picture:'chelsea-guster-index.jpg')
user3 = Users.create(u_id: '905837', name: 'Porsha Quinones', picture:'porsha_quinones_index.jpg')
user4 = Users.create(u_id: '102780', name: 'Christina Casano', picture:'christina_casano_index.jpg')
user5 = Users.create(u_id: '887294', name: 'Masha Zolotarsky', picture:'masha_zolotarsky_index.jpg')
user6 = Users.create(u_id: '103782', name: 'Dennis Marrero', picture:'dennis_marrero_index.jpg')
user7 = Users.create(u_id: '629787', name: 'Cheyanne O\'Connell', picture:'cheyanne_oconnell_index.jpg')
user8 = Users.create(u_id: '505020', name: 'Jessie Love', picture:'jessie_love_index.jpg')
user9 = Users.create(u_id: '752282', name: 'Julianne Sibiski', picture:'julianne_sibiski_index.jpg')
user10 = Users.create(u_id: '776073', name: 'Jacob Wagner', picture:'jacob_wagner_index.jpg')

#friends
Friends.create(user_id: 1, u_id: user1.u_id)
Friends.create(user_id: 1, u_id: user2.u_id)
Friends.create(user_id: 1, u_id: user3.u_id)
Friends.create(user_id: 1, u_id: user4.u_id)
Friends.create(user_id: 1, u_id: user5.u_id)
Friends.create(user_id: 1, u_id: user6.u_id)
Friends.create(user_id: 1, u_id: user7.u_id)
Friends.create(user_id: 1, u_id: user8.u_id)
Friends.create(user_id: 1, u_id: user9.u_id)
Friends.create(user_id: 1, u_id: user10.u_id)