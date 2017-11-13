class Event < ApplicationRecord
  has_many :saved_events
  has_many :events, through: :saved_events
end
