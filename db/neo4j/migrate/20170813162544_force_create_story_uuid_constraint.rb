class ForceCreateStoryUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Story, :uuid, force: true
  end

  def down
    drop_constraint :Story, :uuid
  end
end
