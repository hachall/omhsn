class ResourcesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index

    if params[:query] == ""
      @resources = policy_scope(Resource).order(name: :asc)
    elsif params[:query]
      @resources = policy_scope(Resource).search(params[:query])
    else
      @resources = policy_scope(Resource).order(name: :asc)
    end

    unless @resources.empty?

      resources_w_addr = @resources.select {|resource| resource.latitude != nil && resource.latitude != nil}

      @markers = resources_w_addr.map do |resource|
        {
          lat: resource.latitude,
          lng: resource.longitude,
          name: resource.name,
          infowindow: render_to_string(partial: "resources/resource_infowindow", locals: {resource: resource})
        }
      end
    end
  end

  def show
    @resource = Resource.find(params[:id])
    authorize @resource
    @saved_resource = SavedResource.new
    @resource_coordinates = [{ lat: @resource.latitude, lng: @resource.longitude }]
  end

  def new

    @resource = Resource.new
    authorize @resource
  end

  def create
    @resource = Resource.new(resource_params)
    authorize @resource

    if @resource.save
      redirect_to resource_path(@resource)
    else
      render :new
    end
  end

  def edit
    @resource = Resource.find(params[:id])
    authorize @resource

  end

  def update
    @resource = Resource.find(params[:id])
    authorize @resource
    @resource.update(resource_params)
    redirect_to resource_path(@resource)
  end

  def destroy
    @resource = Resource.find(params[:id])
    authorize @resource
    @resource.destroy
    redirect_to resources_path
  end


  private

  def resource_params
    params.require(:resource).permit(:name, :website, :address, :phone_number, :email, :what_they_do, :about, :tip, :taglines_as_string, :photo, :photo_cache, :category, :card_description, :contacts_as_string)
  end

end
