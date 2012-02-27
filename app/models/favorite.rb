class Favorite < ActiveRecord::Base
	validates_presence_of :name, :address, :description

	scope :approved, where(:approved => true)
end
