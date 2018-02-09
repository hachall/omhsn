class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index

    @events = Event.where.not(latitude: nil, longitude: nil).order(date: :asc)
    @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        name: event.name,
        infowindow: render_to_string(partial: "events/event_infowindow", locals: {event: event}),
        card: render_to_string(partial: "events/event_card", locals: {event: event})
      }
    end
  end

  def show
    @event = Event.find(params[:id])
    @event_coordinates = [{ lat: @event.latitude, lng: @event.longitude }]
  end

  def new

    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :description, :photo, :photo_cache, :address, :card_description)
  end

end
