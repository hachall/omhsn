class UsersController < ApplicationController

  def dashboard
    @user = current_user
    @saved_events = @user.saved_events.order(created_at: :desc)
    @saved_resources = @user.saved_resources.order(created_at: :desc)
  end

end
