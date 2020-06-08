class Opinion < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comments
    has_many :commenters, through: :comments, class_name: 'Comment', source: :author

    validates_presence_of :book_name, :book_author, :published_at, :content, :author_id

    scope :ordered_by_most_recent, -> { order(created_at: :desc) }

    def comments_count
        comments.count
    end
end
