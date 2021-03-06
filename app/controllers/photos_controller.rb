class PhotosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @photos = policy_scope(Photo).all
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    authorize(@photo)
    @photo.save
    redirect_to photos_path
  end

  def destroy
    @photo = Photo.find(params[:id])
    authorize @photo
    @photo.destroy
    redirect_to photos_path
  end

  def edit
    # @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    authorize @photo
    @photo.update(photo_params)
    redirect_to photos_path
  end

  def new_release
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:photo, :description)
  end
end
