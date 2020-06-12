class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :opinion

  validates :content, presence: true, length: { minimum: 30, maximum: 300 }

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
