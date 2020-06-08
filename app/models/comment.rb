class Comment < ApplicationRecord
    belongs_to :author, class_name: 'User'
    belongs_to :opinion

    validate :content, presence: true, length: {minumum: 3, maximum: 300}

    scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
