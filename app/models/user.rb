# -*- coding: utf-8 -*-
class User < ApplicationRecord

  has_many :groups
  has_many :groups_users
  has_many :joind_groups, through: :groups_users, source: :group
  has_many :comments
  has_many :likes

  has_secure_password validations: false

  validates :email, presence: true, length: { maximum: 255 },
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, allow_blank: true},
  uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 4, maximum: 8, allow_blank: true},
  format: { with: /\A[a-zA-Z\d]+\z/, message: "は英数字のみで入力して下さい",allow_blank: true}
  validates :name, presence: true,
  length: {maximum: 10},
  uniqueness: true

  def follow(group)
    self.groups_users.find_or_create_by(group_id: group.id)
  end

  def unfollow(group)
    groups_users = self.groups_users.find_by(group_id: group.id)
    groups_users.destroy if groups_users
  end

  def joind?(group)
    self.joind_groups.include?(group)
  end

  def liked(group_id, rst)
    self.likes.find_or_create_by(group_id: group_id, restaurant_id: rst.id)
  end

  def unliked(group_id, rst)
    like = self.likes.find_by(group_id: group_id, restaurant_id: rst.id)
    like.destroy if like
  end

  def push_liked?(group_id, rst)
    self.likes.exists?(group_id: group_id, restaurant_id: rst.id)
  end
end
