class ResourcesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @resources = Resource.where.not(latitude: nil, longitude: nil)
    @markers = @resources.map do |resource|
      {
        lat: resource.latitude,
        lng: resource.longitude
      }
    end
  end

  def show
    @resource = Resource.find(params[:id])
    @resource_coordinates = [{ lat: @resource.latitude, lng: @resource.longitude }]
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)

    if @resource.save
      redirect_to resource_path(@resource)
    else
      render :new
    end
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    @resource = Resource.find(params[:id])
    @resource.update(resource_params)
    redirect_to resource_path(@resource)
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    redirect_to resources_path
  end


  private

  def resource_params
    params.require(:resource).permit(:name, :website, :address, :phone_number, :email, :what_they_do, :about, :tip, :taglines_as_string, :photo, :photo_cache)
  end

end
