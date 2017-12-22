class Resource < ApplicationRecord
  has_many :saved_resources

  #after_validation :taglines_into_array
  geocoded_by :address
  mount_uploader :photo, PhotoUploader
  after_validation :geocode, if: :will_save_change_to_address?
  #def taglines_into_array
   # self.taglines = self.taglines_as_string.split(' ')
  #end
end
