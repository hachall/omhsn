class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :contact]

  def home
    @events = Event.all
  end

  def about

  end

  def contact

  end

end

