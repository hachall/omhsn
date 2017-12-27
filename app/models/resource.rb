class Resource < ApplicationRecord
  has_many :saved_resources

  CATEGORIES = ['National Health Service', 'Peer Support Groups', 'Self-Help and Apps', 'Helplines', 'Students', 'Support Services', 'Private Medical Practices', 'Emergency']
  validates :category, inclusion: {in: CATEGORIES }

  after_validation :taglines_into_array

  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode

  include AlgoliaSearch

  algoliasearch do
    attributes :category, :taglines_as_string, :what_they_do, :about, :address

    searchableAttributes ['category', 'taglines_as_string', 'what_they_do', 'about', 'address']
  end

  def taglines_into_array
    if self.taglines_as_string
      self.taglines = self.taglines_as_string.split(' ')
    end
  end
  def contacts_into_array
    if self.contacts_as_string
      self.contacts = self.contacts_as_string.split(';')
    end
  end

end
