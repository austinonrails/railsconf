class PagesController < ApplicationController
  def bohconf
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
