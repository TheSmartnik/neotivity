class ForceCreateStoryResourceConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Story, :resource, force: true
  end

  def down
    drop_constraint :Story, :resource
  end
end
