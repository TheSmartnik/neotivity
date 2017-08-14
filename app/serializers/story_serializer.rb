class StorySerializer < ActiveModel::Serializer
  attributes :resource_id, :resource_type, :created_at, :type

  has_many :related_stories, serializer: StorySerializer, except: :related_stories
end
