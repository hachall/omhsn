class Event < ApplicationRecord
  has_many :saved_events

  geocoded_by :address
  mount_uploader :photo, PhotoUploader
  after_validation :geocode
end
