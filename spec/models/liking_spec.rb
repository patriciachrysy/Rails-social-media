require 'rails_helper'

RSpec.describe Liking, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:opinion) }
  end
end
