class Restaurant < ApplicationRecord
  belongs_to :area

  scope :score_desc, -> {order("restaurants.score DESC")}
  def self.search(search)
    if search
      Restaurant.where(['name LIKE ?', "%#{sanitize_sql_like(search)}%"])
    else
      Restaurant.all
    end
  end
end
