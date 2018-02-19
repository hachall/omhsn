class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @events = Event.all
    @user = current_user
  end

  def about

  end

  def contact

  end

end

