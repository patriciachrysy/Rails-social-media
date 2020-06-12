require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:sent_followings).with_foreign_key('follower_id').class_name('Following') }
    it { should have_many(:recieved_followings).with_foreign_key('followed_id').class_name('Following') }
    it { should have_many(:followers).through(:recieved_followings).source(:follower) }
    it { should have_many(:followeds).through(:sent_followings).source(:followed) }
    it { should have_many(:opinions).with_foreign_key('author_id') }
    it { should have_many(:comments).with_foreign_key('author_id') }
    it { should have_many(:commented_opinions).through(:comments).source(:opinion) }
    it { should have_many(:likings) }
    it { should have_many(:liked_opinions).through(:likings).source(:opinion) }
  end

  describe 'Validator' do
    subject { User.create(fullname: 'Test user', username: 'great_test') }

    it { should validate_presence_of(:fullname) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:photo) }
    it { should validate_presence_of(:cover_image) }
    it { should validate_length_of(:fullname).is_at_least(5) }
    it { should validate_length_of(:fullname).is_at_most(50) }
    it { should validate_length_of(:username).is_at_least(5) }
    it { should validate_length_of(:username).is_at_most(10) }
  end
end
