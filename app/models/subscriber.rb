class Subscriber
  include Neo4j::ActiveNode

  property :subscriber_id, type: Integer
  has_many :out, :stories, type: :HAS_STORY
end
