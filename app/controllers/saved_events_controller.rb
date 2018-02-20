class SavedEventsController < ApplicationController
  def create
    saved_event = SavedEvent.new
    #authorize saved_event
    @event = Event.find(params[:event_id])
    saved_event.event = @event
    @user = current_user
    saved_event.user = @user
    saved_event.save
    #redirect_to event_path(@event)
  end

  def destroy
    saved_event = SavedEvent.find(params[:id])
    @user = current_user
    #authorize saved_event
    @event = saved_event.event
    saved_event&.destroy
    #redirect_to event_path(@event)
    render :create
  end

end


