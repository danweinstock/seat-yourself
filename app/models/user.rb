class User < ActiveRecord::Base
	validates :name, :email, presence: true
	has_secure_password
	
	has_many :reservations
	has_many :restaurants, through: :reservations
end
