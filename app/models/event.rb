class Event < ApplicationRecord
  has_many :saved_events, dependent: :destroy
  geocoded_by :address
  mount_uploader :photo, PhotoUploader
  after_validation :geocode
  validates :name, presence: true
  validates :card_description, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :photo, presence: true
end
