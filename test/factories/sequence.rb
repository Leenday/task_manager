FactoryBot.define do
  sequence :first_name do |n|
    "first_name#{n}"
  end

  sequence :last_name do |n|
    "last_name#{n}"
  end

  sequence :password do |n|
    "secret_password#{n}"
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :avatar do |n|
    "avatar#{n}"
  end

  sequence :name do |n|
    "name#{n}"
  end

  sequence :description do |n|
    "description#{n}"
  end

  sequence :state do |n|
    "state#{n}"
  end

  sequence :expired_at do |n|
    "expired_at 2020-04-#{n}"
  end
end
