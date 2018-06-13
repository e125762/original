class Like < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :restaurant

  validates :user_id, presence: true
  validates :group_id, presence: true
  validates :restaurant_id, presence: true
end
