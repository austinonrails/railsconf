class Speaker < ActiveRecord::Base
	validates_presence_of :name, :abstract, :bio, :twitter, :email
end
