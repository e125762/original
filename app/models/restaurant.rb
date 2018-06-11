class Restaurant < ApplicationRecord
  belongs_to :area

  def self.search(search)
    if search
      Restaurant.where(['name LIKE ?', "%#{search}%"])
    else
      Restaurant.all
    end
  end
end
