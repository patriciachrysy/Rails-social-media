require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Associations' do
    it { should belong_to(:author).class_name('User') }
    it { should belong_to(:opinion) }
  end

  describe 'Validator' do
    subject do
      Comment.create(opinion_id: 1, author_id: 1, content: 'It has been referred to as the greatest
     love story of all time, or perhaps the most tragic. Romeo and Juliet serves to satisfy both anyway,
     which for a 1595 play has obviously stuck around for a very long time.')
    end

    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_least(30) }
    it { should validate_length_of(:content).is_at_most(300) }
  end
end
