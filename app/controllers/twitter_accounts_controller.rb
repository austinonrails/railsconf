class TwitterAccountsController < ApplicationController
	before_filter :authenticate

	def new
		twitter_account = TwitterAccount.create
    redirect_to(twitter_account.authorize_url(callback_twitter_accounts_url))
  end

  def edit
    @twitter_account = TwitterAccount.find(params[:id])
  end

  def update
    @twitter_account = TwitterAccount.find(params[:id])

    if @twitter_account.update_attributes(params[:twitter_account])
      redirect_to edit_twitter_account_url(@twitter_account), notice: 'Tweets successfully updated.'
    else
      render action: "edit"
    end
  end

	def callback
		if params[:denied] && !params[:denied].empty?
			render :text => "Unable to connect with twitter: #{parms[:denied]}"
		else
			twitter_account = TwitterAccount.find_by_oauth_token(params[:oauth_token])
			twitter_account.validate_oauth_token(params[:oauth_verifier], callback_twitter_accounts_url)
			twitter_account.save
			if twitter_account.active?
				render :text => "Success!"
			else
				render :text => "Failure!"
			end
		end
	end
end
