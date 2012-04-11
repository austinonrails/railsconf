class TwitterAccount < ActiveRecord::Base
  CONSUMER_KEY = 'NoWlAAFmzK8FQ52yqs3SQ'
  CONSUMER_SECRET = 'MeHoZVIgzYeOUihzMsg0jbsxa1EbtzMnc382hupPazw'
  OPTIONS = {:site => "https://api.twitter.com", :request_endpoint => "https://api.twitter.com", :scheme => :header}

  def authorize_url(callback_url)
    if self.oauth_authorize_url.blank?
      # Step one, generate a request URL with a request token and secret
      signing_consumer = OAuth::Consumer.new(TwitterAccount::CONSUMER_KEY, TwitterAccount::CONSUMER_SECRET, TwitterAccount::OPTIONS)
      request_token = signing_consumer.get_request_token(:oauth_callback => callback_url)
      self.oauth_token = request_token.token
      self.oauth_token_secret = request_token.secret
      self.oauth_authorize_url = request_token.authorize_url
      self.save!
    end
    self.oauth_authorize_url
  end

  def validate_oauth_token(oauth_verifier, callback_url)
    begin
      signing_consumer = OAuth::Consumer.new(TwitterAccount::CONSUMER_KEY, TwitterAccount::CONSUMER_SECRET, TwitterAccount::OPTIONS)
      access_token = OAuth::RequestToken.new(signing_consumer, self.oauth_token, self.oauth_token_secret).
                                         get_access_token(:oauth_verifier => oauth_verifier)
      self.oauth_token = access_token.params[:oauth_token]
      self.oauth_token_secret = access_token.params[:oauth_token_secret]
      self.stream_url = "http://twitter.com/#{access_token.params[:screen_name]}"
      self.screen_name = access_token.params[:screen_name]
      self.active = true
    rescue OAuth::Unauthorized
      self.errors.add(:oauth_token, "Invalid OAuth token, unable to connect to twitter")
      self.active = false
    end
    self.save!
  end

  def tweet_about_session(session)
    if session.tweeted_at.blank?
    	
    	self.post(message.body)
    end
  end

  def post(message)
    Twitter.configure do |config|
      config.consumer_key = TwitterAccount::CONSUMER_KEY
      config.consumer_secret = TwitterAccount::CONSUMER_SECRET
      config.oauth_token = self.oauth_token
      config.oauth_token_secret = self.oauth_token_secret
    end
    client = Twitter::Client.new
    client.update(message)
  end
end
