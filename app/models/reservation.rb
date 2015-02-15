class Reservation < ActiveRecord::Base

	belongs_to :restaurant
	belongs_to :user
	
	validates :party_size, :date, presence: true 
  validates :party_size, numericality: {greater_than_or_equal_to: 0}
  
end
