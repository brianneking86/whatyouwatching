# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Users
user1 = User.create(u_id: '228277', name: 'Rebecca Cooper', picture:'rebecca_cooper_index.jpg')
user2 = User.create(u_id: '480357', name: 'Chelsea Guster', picture:'chelsea-guster-index.jpg')
user3 = User.create(u_id: '905837', name: 'Porsha Quinones', picture:'porsha_quinones_index.jpg')
user4 = User.create(u_id: '102780', name: 'Christina Casano', picture:'christina_casano_index.jpg')
user5 = User.create(u_id: '887294', name: 'Masha Zolotarsky', picture:'masha_zolotarsky_index.jpg')
user6 = User.create(u_id: '103782', name: 'Dennis Marrero', picture:'dennis_marrero_index.jpg')
user7 = User.create(u_id: '629787', name: 'Cheyanne OConnell', picture:'cheyanne_oconnell_index.jpg')
user8 = User.create(u_id: '505020', name: 'Jessie Love', picture:'jessie_love_index.jpg')
user9 = User.create(u_id: '752282', name: 'Julianne Sibiski', picture:'julianne_sibiski_index.jpg')
user10 = User.create(u_id: '776073', name: 'Jacob Wagner', picture:'jacob_wagner_index.jpg')

#friends- my friends user_id 1 = Brianne
Friend.create(user_id: 1, u_id: user1.u_id)
Friend.create(user_id: 1, u_id: user2.u_id)
Friend.create(user_id: 1, u_id: user3.u_id)
Friend.create(user_id: 1, u_id: user4.u_id)
Friend.create(user_id: 1, u_id: user5.u_id)
Friend.create(user_id: 1, u_id: user6.u_id)
Friend.create(user_id: 1, u_id: user7.u_id)
Friend.create(user_id: 1, u_id: user8.u_id)
Friend.create(user_id: 1, u_id: user9.u_id)
Friend.create(user_id: 1, u_id: user10.u_id)

#friends Rebecca
Friend.create(user_id: user1.id, u_id: user3.u_id)
Friend.create(user_id: user1.id, u_id: user4.u_id)
Friend.create(user_id: user1.id, u_id: user6.u_id)
Friend.create(user_id: user1.id, u_id: user10.u_id)
Friend.create(user_id: user1.id, u_id: user8.u_id)
Friend.create(user_id: user1.id, u_id: "10101966113823935")

#friends Jacob
Friend.create(user_id: user10.id, u_id: user1.u_id)
Friend.create(user_id: user10.id, u_id: user1.u_id)
Friend.create(user_id: user10.id, u_id: user6.u_id)
Friend.create(user_id: user10.id, u_id: "10101966113823935")

#friends Christina
Friend.create(user_id: user4.id, u_id: user6.u_id)
Friend.create(user_id: user4.id, u_id: user5.u_id)
Friend.create(user_id: user4.id, u_id: user3.u_id)
Friend.create(user_id: user4.id, u_id: user1.u_id)
Friend.create(user_id: user4.id, u_id: "10101966113823935")

#friends Masha
Friend.create(user_id: user5.id, u_id: user6.u_id)
Friend.create(user_id: user5.id, u_id: user4.u_id)
Friend.create(user_id: user5.id, u_id: user3.u_id)
Friend.create(user_id: user5.id, u_id: user1.u_id)
Friend.create(user_id: user5.id, u_id: "10101966113823935")

#friends Porsha
Friend.create(user_id: user3.id, u_id: "10101966113823935")
Friend.create(user_id: user3.id, u_id: user5.u_id)
Friend.create(user_id: user3.id, u_id: user4.u_id)
Friend.create(user_id: user3.id, u_id: user6.u_id)

show_array = [
  {"Doctor Who" => [user1, user4, user6, user10]}, 
  {"Breaking Bad" => [user4, user5, user6, user8, user10]}, 
  {"The Walking Dead" => [user4, user5, user6, user8, user10]},
  {"House of Cards" => [user4, user5, user6, user9]},
  {"Gilmore Girls" => [user1, user2, user7, user8, user9]},
  {"Veronica Mars" => [user1, user7]},
  {"Game of Thrones" => [user4, user7, user5, user6, user10]},
  {"Arrested Development" => [user4, user5, user6, user10]},
  {"Friends" => [user1, user7, user8]},
  {"Freaks and Geeks" => [user4, user5, user6, user8, user10]},
  {"House M.D." => [user1, user7, user10]},
  {"The Daily Show with Jon Stewart" => [user2, user5, user6, user9, user10]},
  {"The Office" => [user2, user5, user10]},
  {"Downton Abbey" => [user7, user8, user9]},
  {"Friday Night Lights" => [user1, user10]},
  {"Boardwalk Empire" => [user4, user5, user6, user10]},
  {"The Newsroom" => [user4, user6, user9, user10]},
  {"Bar Rescue" => [user3]},
  {"Vikings" => [user3, user8]},
  {"New Girl" => [user2, user7, user8]},
  {"Law & Order: Special Victims Unit" => [user1, user2, user3, user9]},
  {"Scandal" => [user1, user2, user3, user5, user7]},
  {"Grimm" => [user3, user7]},
  {"How to Get Away with Murder" => [user2, user3]}
]

show_array.each do |show_hsh|
  show_name = show_hsh.keys[0]
  viewer_array = show_hsh.values[0]
  viewer_array.each do |viewer|
    Show.find_show(show_name, viewer)
  end
end


