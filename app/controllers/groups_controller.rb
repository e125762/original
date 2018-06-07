# -*- coding: utf-8 -*-
class GroupsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  before_action :require_group_join, only: [:show]

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

  def show
    @group = Group.find(params[:id])
    @group_users = @group.joind_users
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      flash[:success] = '登録が完了しました'
      redirect_to groups_url
    else
      flash.now[:danger] = '登録に失敗しました'
      render :edit
    end
  end

  def destroy
    @group.destroy
    flash[:success] = 'メッセージを削除しました'
    redirect_to groups_url
  end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end

  def correct_user
    @group = current_user.groups.find_by(id: params[:id])
    unless @group
      redirect_to root_url
    end
  end

  def require_group_join
    group = Group.find(params[:id])
    unless current_user.joind?(group)
      redirect_to root_url
    end
  end
end
