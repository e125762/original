# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:groups_users]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザー登録が完了しました"
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました'
      render :new
    end
  end

  #参加しているグループ一覧用
  def groups_users
    @user = User.find(params[:id])
    @joind = @user.joind_groups.page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
