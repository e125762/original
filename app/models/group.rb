# -*- coding: utf-8 -*-
class Group < ApplicationRecord
  belongs_to :user

  validates :title, presence: { message: "説明文を入力してください"}, length: { maximum: 20, message: "20字以内"}
  validates :description, presence: { message: "説明文を入力してください"}, length: { maximum: 100, message: "100字以内" }
end
