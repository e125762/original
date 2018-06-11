class Restaurant < ApplicationRecord
  belongs_to :area

  def self.search(search)
    if search
      Restaurant.where(['name LIKE ?', "%#{sanitize_sql_like(search)}%"])
    else
      Restaurant.all
    end
  end
end
