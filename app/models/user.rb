class User < ApplicationRecord
  has_many :saved_resources
  has_many :saved_events
  has_many :events, through: :saved_events
  has_many :resources, through: :saved_resources
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def save_resource(resource)
    saved_resources.find { |sr| sr.resource == resource }
  end

  def saved?(resource)
    saved_resources.include? resource
  end
end
