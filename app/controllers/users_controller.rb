class UsersController < ApplicationController

  def show
    @user = current_user
    @saved_events = @user.saved_events
    @saved_resources = @user.saved_resources
  end

end
