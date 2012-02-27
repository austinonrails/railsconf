class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate

	protected
	def authenticate
	  authenticate_or_request_with_http_basic do |username, password|
	  	if Rails.env.production?
	  		username == ENV['HTTP_USER'] && password == ENV['HTTP_PASSWORD']
	  	else
	    	username == "foo" && password == "bar"
	  	end
	  end
	end
end
