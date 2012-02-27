class Guest < ActiveRecord::Base
	validates_presence_of :name, :email, :phone, :bio
end
