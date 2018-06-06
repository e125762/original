# -*- coding: utf-8 -*-
class GroupsController < ApplicationController
  before_action :require_user_logged_in

  def index
    @groups = Group.all.order('created_at DESC').page(params[:page])
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:success] = '登録が完了しました'
      redirect_to groups_url
    else
      flash.now[:danger] = '登録に失敗しました'
      render :new
    end
  end

  def new
    @group = current_user.groups.build
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
