class Resource < ApplicationRecord
  has_many :users, through: :saved_resources
end
