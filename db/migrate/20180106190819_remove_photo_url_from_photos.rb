class RemovePhotoUrlFromPhotos < ActiveRecord::Migration[5.1]
  def change
    remove_column :photos, :photo_url
  end
end
