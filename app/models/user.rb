# -*- coding: utf-8 -*-
class User < ApplicationRecord

  has_many :groups
  has_many :groups_users
  has_many :joind_groups, through: :groups_users, source: :group

  has_secure_password validations: false

  validates :email, presence: {message: "メールアドレスを入力してください"}, length: { maximum: 255 },
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "メールアドレスの形式で入力してください", allow_blank: true},
  uniqueness: { case_sensitive: false, message: "既に登録されています" }
  validates :password, presence: {message: "パスワードを入力してください"}, length: { minimum: 4, maximum: 8, message: "4文字以上8文字以下", allow_blank: true},
  format: { with: /\A[a-zA-Z\d]+\z/, message: "英数字のみ", allow_blank: true}
  validates :name, presence: {message: "名前を入力してください"},
  length: {maximum: 10, message: "名前は10字以内にしてください"},
  uniqueness: {message: "既に使用されている名前です"}

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
end
