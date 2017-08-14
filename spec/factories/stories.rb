FactoryGirl.define do
  factory :story do
    association :subscriber

    resource_type { generate :resource_type }
    type { 'type' }
    resource_id { generate :id }
    resource { "#{resource_type}-#{resource_id}" }

    trait :with_origin do
      origin_type { generate :resource_type }
      origin_id { generate :id }
    end
  end
end
