class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tv
  validates_uniqueness_of :tv_id, scope: :user_id
end
