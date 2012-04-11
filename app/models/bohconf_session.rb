class BohconfSession < ActiveRecord::Base
	validates_presence_of :title, :host_email
end
