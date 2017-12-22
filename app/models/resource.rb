class Resource < ApplicationRecord
  has_many :saved_resources

  after_validation :taglines_into_array
  after_validation :contacts_into_array



  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode

  include AlgoliaSearch

  algoliasearch do
    attribute :taglines_as_string, :what_they_do. :about

    searchableAttributes ['taglines_as_string', 'what_they_do', 'about']

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
