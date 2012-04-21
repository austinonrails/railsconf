class PagesController < ApplicationController
  def bohconf
  end

  def bohconf_now
    # show me sessions that have started in the last hour
    # or will start in the next 20 minutes
    # that havent ended yet
    @sessions = BohconfSession.approved.
      where('starts_at >= ?', 1.hour.ago).
      where('starts_at <= ?', 20.minutes.from_now).
      where('ends_at >= ?', Time.now).
      order('starts_at')

    if @sessions.empty?
      redirect_to bohconf_soon_url
    else
      render :layout => 'bohconf'
    end
  end

  def bohconf_soon
    @sessions = BohconfSession.approved.
      where('starts_at >= ?', Time.now).
      where('ends_at >= ?', Time.now).
      order('starts_at')

    @sessions = @sessions.where('session_type = ?', params[:session_type]) if params[:session_type].present?

    render :layout => 'bohconf'
  end

  def ignite
  end

  def talk
    @favorites = Favorite.approved
  end

  def stay
  end

  def fivek
  end

  def happy
  end

  def kids
  end

  def sponsor
  end

  def usergroups
  end
end
