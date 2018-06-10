# -*- coding: utf-8 -*-
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :comment, presence: { message: "コメントを入力してください"}, length: { maximum: 200, message: "200字以内"}
end
