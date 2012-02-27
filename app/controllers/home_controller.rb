class HomeController < ApplicationController
	skip_before_filter :authenticate
  def index
  	@favorites = Favorite.approved
  end
end
