class SavedEventsController < ApplicationController
  def create
    saved_event = SavedEvent.new
    @event = Event.find(params[:event_id])
    saved_event.event = @event
    @user = current_user
    saved_event.user = @user
    saved_event.save
    redirect_to :back
  end

  def destroy
    saved_event = SavedEvent.find(params[:id])
    @user = current_user
    @event = saved_event.event
    saved_event&.destroy
    redirect_to :back
  end

end
