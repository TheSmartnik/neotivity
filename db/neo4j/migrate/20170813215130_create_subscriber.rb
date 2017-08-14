class CreateSubscriber < Neo4j::Migrations::Base
  def up
    add_constraint :Subscriber, :uuid
  end

  def down
    drop_constraint :Subscriber, :uuid
  end
end
