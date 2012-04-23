class BohconfSessionsController < ApplicationController
  layout 'bohconf'
  before_filter :authenticate, :only => [:destroy, :write_tweet, :send_tweet]
  before_filter :authorized_to_edit_bohconf_session, :only => [:edit, :update]

  def index
    # show me sessions that have started in the last hour
    # or will start in the next 20 minutes
    # that havent ended yet
    @sessions = BohconfSession.approved.
      where('starts_at >= ?', 1.hour.ago).
      where('starts_at <= ?', 20.minutes.from_now).
      where('ends_at >= ?', Time.now).
      order('starts_at')

    
    redirect_to bohconf_sessions_soon_path if @sessions.empty?
  end

  def soon
    @sessions = BohconfSession.approved.
      where('starts_at >= ?', Time.now).
      where('ends_at >= ?', Time.now).
      order('starts_at')

    @sessions = @sessions.where('session_type = ?', params[:session_type]) if params[:session_type].present?
  end

  def show
    @bohconf_session = BohconfSession.find(params[:id])

    render :layout => 'bohconf'
  end

  def new
    @bohconf_session = BohconfSession.new
  end

  def edit

  end

  def create
    @bohconf_session = BohconfSession.new(params[:bohconf_session])
    @bohconf_session.starts_at = params[:bohconf_session][:starts_at].to_time
    @bohconf_session.ends_at = params[:bohconf_session][:ends_at].to_time

    @bohconf_session.token = SecureRandom.hex(10)

    if @bohconf_session.save
      AdminMailer.submission(@bohconf_session).deliver
      UserMailer.bohconf_session_submitted(@bohconf_session).deliver
      if @admin
        redirect_to tweet_bohconf_session_url(@bohconf_session)
      else
        redirect_to thanks_bohconf_sessions_url
      end
    else
      render :new
    end
  end

  # PUT /bohconf_sessions/1
  # PUT /bohconf_sessions/1.json
  def update
    @bohconf_session = BohconfSession.find(params[:id])
    params[:bohconf_session][:starts_at] = params[:bohconf_session][:starts_at].to_time
    params[:bohconf_session][:ends_at] = params[:bohconf_session][:ends_at].to_time
    if @bohconf_session.update_attributes(session_params)
      redirect_to bohconf_path, notice: 'Session was successfully updated.'
    end
  end

  def destroy
    @bohconf_session = BohconfSession.find(params[:id])
    @bohconf_session.destroy
  end

  def tweet
    @bohconf_session = BohconfSession.find(params[:id])
  end

  def send_tweet
    @bohconf_session = BohconfSession.find(params[:id])
    @tweet = bohconf_twitter_account.post(params[:tweet_body])
    if @tweet
      redirect_to @bohconf_session, notice: 'Tweeted!'
    else
      render :write_tweet
    end
  end

  private
  def authorized_to_edit_bohconf_session
    @bohconf_session = BohconfSession.find(params[:id])
    unless (params[:token].present? && @bohconf_session.token == params[:token]) || authenticate
      redirect_to(bohconf_sessions_path, notice: "Looks like you're not authorized.") && return
    end
  end
  def session_params
    if @admin
      params[:bohconf_session]
    else
      p = params[:bohconf_session]
      p.delete(:hide)
      p
    end
  end
end
