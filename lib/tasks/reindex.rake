namespace :resources do
  task reindex: :environment do
    Resource.reindex
  end

  task reindex_all: :environment do
    Rails.application.eager_load!
    algolia_models = ActiveRecord::Base.descendants.select{ |model| model.respond_to?(:reindex) }
    algolia_models.each(&:reindex)
  end
end
