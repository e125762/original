# -*- coding: utf-8 -*-
class Group < ApplicationRecord
  belongs_to :user
  has_many :groups_users, dependent: :destroy
  has_many :joind_users, through: :groups_users, source: :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_rsts, through: :likes, source: :restaurant

  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 100 }

end
