class User < ApplicationRecord
  has_many :saved_resources
  has_many :saved_events
  has_many :events, through: :saved_events
  has_many :resources, through: :saved_resources
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
