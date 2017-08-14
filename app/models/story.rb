class Story
  include Neo4j::ActiveNode
  property :type, type: String
  property :resource_type, type: String
  property :resource_id, type: Integer
  property :resource, type: String, constraint: :unique # unique constaint can't be applied accros multiple lables
  property :origin_type, type: String
  property :origin_id, type: String
  property :subscriber_id, type: Integer
  property :created_at, type: DateTime, default: -> { Time.now }

  has_one :in, :subscriber, type: :HAS_STORY
  has_many :both, :related_stories, type: :RELATED, model_class: :Story
end
