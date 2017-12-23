class SavedResourcesController < ApplicationController
  def create
    saved_resource = SavedResource.new
    @resource = Resource.find(params[:resource_id])
    saved_resource.resource = @resource
    @user = current_user
    saved_resource.user = @user
    saved_resource.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    saved_resource = SavedResource.find(params[:id])
    @user = current_user
    @resource = saved_resource.resource
    saved_resource&.destroy
    redirect_back(fallback_location: root_path)
  end

end
