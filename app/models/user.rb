class User < ApplicationRecord
  has_many :saved_resources, dependent: :destroy
  has_many :saved_events, dependent: :destroy
  has_many :events, through: :saved_events
  has_many :resources, through: :saved_resources
  validates :first_name, presence: true
  validates :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def save_resource(resource)
    saved_resources.find { |sr| sr.resource == resource }
  end

  def saved_resource?(resource)
    saved_resources.pluck(:resource_id).include? resource.id
  end

  def save_event(event)
    saved_events.find { |se| se.event == event }
  end

  def saved_event?(event)
    saved_events.pluck(:event_id).include? event.id
  end
end
