# -*- coding: utf-8 -*-
class LikesController < ApplicationController
  before_action :require_user_logged_in

  def create
    rst = Restaurant.find(params[:rst_id])
    current_user.liked(params[:group_id], rst)
    flash[:success] = '行きたいに追加しました'
    redirect_to group_restaurants_url(params[:group_id])
  end

  def destroy
    rst = Restaurant.find(params[:rst_id])
    current_user.unliked(params[:group_id], rst)
    flash[:success] = '行きたいを解除しました'
    redirect_to group_restaurants_url(params[:group_id])
  end
end
