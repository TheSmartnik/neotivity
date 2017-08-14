FactoryGirl.define do
  sequence :resource_type do
    %w(Bookshelf Marker Post Impression).sample
  end

  sequence :integer, aliases: [:id] do |n|
    n
  end
end
