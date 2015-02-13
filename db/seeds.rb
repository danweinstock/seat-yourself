# user = User.where(email: 'dtart@gmail.com').first_or_initialize
# if user.new_record?
# 	user.update_attributes(
# 		:name => "Donna Tart",
# 		:email => "dtart@gmail.com",
# 	)
# end
User.find_or_create_by(email: "dtart@gmail.com", name: "Donna Tart")

Restaurant.create!(
	:name => "Little Pepper" ,
	:cuisine => "Asian Fusion" ,
	:neighbourhood => "Annex",
	:capacity => 50,
	:open => 11,
	:closed => 23
	:id => 1
)

Reservation.create!(
	:party_size => 2,
	:date => Date.today,
	:time => 22
	)

Restaurant.create!(
	:name => "Fat Pasha" ,
	:cuisine => "Mid Eastern" ,
	:neighbourhood => "St Clair W",
	:capacity => 50,
	:open => 11,
	:closed => 23
)

Restaurant.create!(
	:name => "Canoe" ,
	:cuisine => "Contemporary" ,
	:neighbourhood => "Yonge and Eg",
	:capacity => 50,
	:open => 11,
	:closed => 23
)

Restaurant.create!(
	:name => "El Rincon" ,
	:cuisine => "Mexican" ,
	:neighbourhood => "St Clair W",
	:capacity => 50,
	:open => 11,
	:closed => 23
)