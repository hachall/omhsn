class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :contact, :emergency, :emergency_A, :emergency_B]

  def home
    @events = Event.all

  end

  def about

  end

  def contact

  end

  def emergency

  end

  def emergency_A

  end

  def emergency_B

  end

end

