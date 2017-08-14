class ForceCreateStorySubscriberIdIndex < Neo4j::Migrations::Base
  def up
    add_index :Story, :subscriber_id, force: true
  end

  def down
    drop_index :Story, :subscriber_id
  end
end
