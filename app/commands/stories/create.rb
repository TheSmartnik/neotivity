class Stories::Create
  attr_reader :attributes, :subscriber

  def self.call(args)
    new(**args).call
  end

  def initialize(subscriber:,  attributes:)
    @subscriber = subscriber
    @attributes = attributes
  end

  def call
    collection = if glue_days_threshold && related_story
      related_story.related_stories
    else
      subscriber.stories
    end

    collection << story
    true
  end

  private

  def glue_days_threshold
    @glue_days_threshold ||= GlueSettings[attributes[:type]]
  end

  def related_story
    relation = subscriber.stories.where(resource_type: attributes[:resource_type])
    relation = add_origin(relation) if attributes[:origin_type]
    relation.find_by("n.created_at > #{glue_days_threshold.days.ago.to_i}")
  end

  def story
    @story ||= Story.create(attributes)
  end

  def add_origin(relation)
    relation.where(origin_id: attributes[:origin_id], origin_type: attributes[:origin_type])
  end
end
