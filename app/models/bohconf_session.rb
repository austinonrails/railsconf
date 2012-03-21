class BohconfSession < ActiveRecord::Base
	validates_presence_of :title, :abstract, :host_name, :host_email, :host_bio
end
