class Reservation < ActiveRecord::Base

	belongs_to :restaurant
	belongs_to :user
	
	validates :date, :party_size, presence: true 
  validates :party_size, numericality: {only_integer: true, greater_than_or_equal_to: 1}
  
end
