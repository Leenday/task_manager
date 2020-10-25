FactoryBot.define do
  factory :user do
    first_name
    last_name
    password
    email
    avatar
    type { '' }
  end

  factory :developer, parent: :user do
    type { 'Developer' }
  end

  factory :admin, parent: :user do
    type { 'Admin' }
  end

  factory :manager, parent: :user do
    type { 'Manager' }
  end
end