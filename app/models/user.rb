class User < ApplicationRecord
    validates_uniqueness_of :username
    validates :fullname, presence: true, length: { minimum: 5, maximum: 50 }
    validates :username, presence: true, length: { minimum: 5, maximum: 10 }
    validates :photo, presence: true
    validates :cover_image, presence: true

    scope :all_users_except_me, ->(user) { where.not(id: user) }

    has_one_attached :photo
    has_one_attached :cover_image
end
