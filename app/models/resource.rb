class Resource < ApplicationRecord
  has_many :saved_resources

  after_validation :taglines_into_array



  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode

  def taglines_into_array
    if self.taglines_as_string
      self.taglines = self.taglines_as_string.split(' ')
    end
  end
end
