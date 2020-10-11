FactoryBot.define do
  factory :task do
    name
    description
    state
    expired_at

    association :author, factory: :manager
    association :assignee, factory: :developer
  end
end
