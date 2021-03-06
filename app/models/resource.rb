class Resource < ApplicationRecord
  has_many :saved_resources, dependent: :destroy

  #CATEGORIES = ['National Health Service', 'Peer Support Groups', 'Self-Help and Apps', 'Helplines', 'Students', 'Support Services', 'Private Therapy Services', 'Emergency']
  #validates :category, inclusion: {in: CATEGORIES }
  validates :name, presence: true
  validates :what_they_do, presence: true
  validates :about, presence: true
  validates :tip, presence: true
  validates :photo, presence: true
  validates :category, presence: true
  validates :card_description, presence: true
  after_validation :taglines_into_array, on: [:create, :update]
  # after_validation :contacts_into_array, on: [:create, :update]

  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include AlgoliaSearch

  algoliasearch do
    attributes :category, :taglines_as_string, :name, :what_they_do, :about, :address

    searchableAttributes ['category', 'taglines_as_string', 'name', 'what_they_do', 'about', 'address']
  end

  def taglines_into_array
    if self.taglines_as_string
      self.taglines = self.taglines_as_string.split(';')
    end
  end
  def contacts_into_array
    if self.contacts_as_string
      self.contacts = self.contacts_as_string.split(';')
    end
  end

end
