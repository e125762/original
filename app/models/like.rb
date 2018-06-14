class Like < ApplicationRecord
  scope :group_likes_count, ->(group_id) { where(group_id: group_id).group(:restaurant_id).count(:restaurant_id) }

  belongs_to :user
  belongs_to :group
  belongs_to :restaurant

  validates :user_id, presence: true
  validates :group_id, presence: true
  validates :restaurant_id, presence: true
end
