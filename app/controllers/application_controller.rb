class ApplicationController < ActionController::Base
  protect_from_forgery

  def bohconf_twitter_account
  	TwitterAccount.find(4)
  end
  helper_method :bohconf_twitter_account

	protected
	def authenticate
	  authenticate_or_request_with_http_basic do |username, password|
	  	if Rails.env.production?
	  		if username == ENV['HTTP_USER'] && password == ENV['HTTP_PASSWORD']
	  			@admin = true
	  			true
	  		else
	  			false
	  		end
	  	else
	    	if username == "foo" && password == "bar"
	    		@admin = true
	  			true
	  		else
	  			false
	  		end
	  	end
	  end
	end
end
