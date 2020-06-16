require 'rails_helper'

RSpec.describe Opinion, type: :model do
  describe 'Associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:comments) }
    it { should have_many(:commenters).through(:comments).source(:author) }
    it { should have_many(:likings) }
    it { should have_many(:likes).class_name('Liking') }
    it { should have_many(:dislikes).class_name('Liking') }
    it { should have_many(:judges).through(:likings).source(:user) }
  end

  describe 'Validator' do
    subject do
      Opinion.create(book_name: 'Test user', book_author: 'great_test', published_at: DateTime.now,
                     content: 'It has been referred to as the greatest love story of all time, or perhaps
    the most tragic. Romeo and Juliet serves to satisfy both anyway, which for a 1595 play has
     obviously stuck around for a very long time, which points to how good a book can turn out to be
      centuries after its author graced our good planet.', author_id: 1)
    end

    it { should validate_presence_of(:book_name) }
    it { should validate_presence_of(:book_author) }
    it { should validate_presence_of(:published_at) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:author_id) }
    it { should validate_length_of(:content).is_at_least(10) }
    it { should validate_length_of(:content).is_at_most(1000) }
  end
end
