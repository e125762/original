# -*- coding: utf-8 -*-
class CommentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :require_group_join

  def create
    @group = Group.find(params[:group_id])
    @comment = current_user.comments.build(comment_params(@group.id))
    if @comment.save
      flash[:success] = "コメント投稿しました"
      redirect_to @group
    else
      @comments = @group.comments.order('created_at DESC').page(params[:page]).per(5)
      @restaurants = @group.like_rsts.distinct.order(:id).page(params[:page]).per(5)
      flash.now[:danger] = "コメントの投稿に失敗しました"
      render "groups/show"
    end
  end

  private

  def comment_params(group_id)
    params.require(:comment).permit(:comment).merge(group_id: group_id)
  end
end
