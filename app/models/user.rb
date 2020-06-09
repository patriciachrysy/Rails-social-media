class User < ApplicationRecord
    validates_uniqueness_of :username
    validates :fullname, presence: true, length: { minimum: 5, maximum: 50 }
    validates :username, presence: true, length: { minimum: 5, maximum: 10 }
    validates :photo, presence: true
    validates :cover_image, presence: true

    scope :all_users_except_me, ->(user) { where.not(id: user) }

    has_one_attached :photo
    has_one_attached :cover_image

    has_many :sent_followings, class_name: 'Following', foreign_key: 'follower_id'
    has_many :recieved_followings, class_name: 'Following', foreign_key: 'followed_id'
    has_many :followers, through: :recieved_followings, source: :follower
    has_many :followeds, through: :sent_followings, source: :followed

    has_many :opinions, foreign_key: 'author_id'

    has_many :comments, foreign_key: 'author_id'
    has_many :commented_opinions, through: :comments, class_name: 'Comment', source: :opinions

    def followed?(user)
        followers.include?(user)
    end

    def follows?(user)
        followeds.include?(user)
    end

    def followers_count
        followers.count
    end

    def followeds_count
        followeds.count
    end

    def opinions_count
        opinions.count
    end

    def owns?(opinion_id)
        opinions.any? {|op| op.id == opinion_id}
    end

    def owns_comment?(comment_id)
        comments.any? {|comment| comment.id == comment_id}
    end

    def opinion_feed
        followeds_ids = []
        followeds.each { |f| followeds_ids << f.id }
        Opinion.where(author: (followeds_ids + [id]))
    end
end
