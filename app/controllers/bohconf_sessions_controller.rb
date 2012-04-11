class BohconfSessionsController < ApplicationController
  before_filter :authenticate, :only => [:index, :destroy, :show, :write_tweet, :send_tweet]
  before_filter :authorized_to_edit_bohconf_session, :only => [:edit, :update]
  # GET /bohconf_sessions
  # GET /bohconf_sessions.json
  def index
    @bohconf_sessions = BohconfSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bohconf_sessions }
    end
  end

  # GET /bohconf_sessions/1
  # GET /bohconf_sessions/1.json
  def show
    @bohconf_session = BohconfSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bohconf_session }
    end
  end

  # GET /bohconf_sessions/new
  # GET /bohconf_sessions/new.json
  def new
    @bohconf_session = BohconfSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bohconf_session }
    end
  end

  # GET /bohconf_sessions/1/edit
  def edit
  end

  # POST /bohconf_sessions
  # POST /bohconf_sessions.json
  def create
    @bohconf_session = BohconfSession.new(params[:bohconf_session])
    @bohconf_session.hide = true
    @bohconf_session.token = SecureRandom.hex(10)
    respond_to do |format|
      if @bohconf_session.save
        AdminMailer.submission(@bohconf_session).deliver
        UserMailer.bohconf_session_submitted(@bohconf_session).deliver
        format.html { redirect_to thanks_bohconf_sessions_url }
        format.json { render json: @bohconf_session, status: :created, location: @bohconf_session }
      else
        format.html { render action: "new" }
        format.json { render json: @bohconf_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bohconf_sessions/1
  # PUT /bohconf_sessions/1.json
  def update
    @bohconf_session = BohconfSession.find(params[:id])
    respond_to do |format|
      if @bohconf_session.update_attributes(session_params)
        format.html { redirect_to bohconf_path, notice: 'Bohconf session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bohconf_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bohconf_sessions/1
  # DELETE /bohconf_sessions/1.json
  def destroy
    @bohconf_session = BohconfSession.find(params[:id])
    @bohconf_session.destroy

    respond_to do |format|
      format.html { redirect_to bohconf_sessions_url }
      format.json { head :no_content }
    end
  end

  def write_tweet
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
