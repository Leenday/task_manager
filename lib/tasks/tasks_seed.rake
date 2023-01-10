# frozen_string_literal: true

namespace :tasks do
  desc 'generates tasks'
  task generate: :environment do
    admin = Admin.find_or_create_by(first_name: 'admin', last_name: 'admin', email: 'admin@localhost.com')
    10.times do |i|
      Task.create(
        name: "card_name_#{i}",
        description: "card_description_#{i}",
        author: admin,
        state: %w[new_task in_development in_qa in_codereview ready_for_release released archived].sample
      )
    end
  end
end
