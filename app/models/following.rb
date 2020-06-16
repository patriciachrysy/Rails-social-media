class Following < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validates :follower_id, uniqueness: { scope: :followed_id }
  validate :self_following

  def self_following
    return unless follower_id == followed_id

    errors.add(:follower_id, 'You cannot follow yourself')
  end
end
