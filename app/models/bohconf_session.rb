class BohconfSession < ActiveRecord::Base
	validates_presence_of :title, :host_email

	scope :approved, where(:hide => false)
end
