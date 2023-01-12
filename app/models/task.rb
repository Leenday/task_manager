class Task < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :author, presence: true
  validates :description, length: { maximum: 500 }

  state_machine initial: :new_task do
    state :new_task
    state :in_development
    state :in_qa
    state :in_codereview
    state :ready_for_release
    state :released
    state :archived

    event :develop do
      transition %i[new_task in_qa in_codereview] => :in_development
    end

    event :qa do
      transition in_development: :in_qa
    end

    event :codereview do
      transition in_qa: :in_codereview
    end

    event :reviwed do
      transition in_codereview: :ready_for_release
    end

    event :release do
      transition ready_for_release: :released
    end

    event :archive do
      transition %i[new_task released] => :archived
    end
  end
end
