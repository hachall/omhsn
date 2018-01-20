namespace :reindex do
  task resources: :environment do
    Resource.reindex
  end

  task events: :environment do
    Event.reindex
  end

  task all: :environment do
    Rails.application.eager_load!
    algolia_models = ActiveRecord::Base.descendants.select{ |model| model.respond_to?(:reindex) }
    algolia_models.each(&:reindex)
  end
end
