class Restaurant < ActiveRecord::Base
	#validates :name, :capacity presence: true

	has_many :reservations
	has_many :users, through: :reservations
	#belongs_to :owner, :class_name => "User"

	def availibility(party_size, date)
		reserved = reservations.sum(:party_size)
    party_size <= (capacity - reserved)
  end
end