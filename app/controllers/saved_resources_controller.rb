class SavedResourcesController < ApplicationController
  def create
    saved_resource = SavedResource.new
    #authorize saved_resource
    @resource = Resource.find(params[:resource_id])
    saved_resource.resource = @resource
    @user = current_user
    saved_resource.user = @user
    saved_resource.save

    #redirect_to resource_path(@resource)
  end

  def destroy
    saved_resource = SavedResource.find(params[:id])
    #authorize saved_resource
    @user = current_user
    @resource = saved_resource.resource
    saved_resource&.destroy

    render :create
    #redirect_to resource_path(@resource)
  end

end
