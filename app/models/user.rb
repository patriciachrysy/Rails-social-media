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
end
