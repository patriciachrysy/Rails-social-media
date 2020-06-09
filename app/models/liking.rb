class Liking < ApplicationRecord
    belongs_to :opinion
    belongs_to :user

    validates :user_id, uniqueness: {scope: :opinion_id}
end
