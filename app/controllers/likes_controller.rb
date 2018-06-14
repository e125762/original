# -*- coding: utf-8 -*-
class LikesController < ApplicationController
  before_action :require_user_logged_in
  before_action :require_group_join

  def create
    @group = Group.find(params[:group_id])
    @rst = Restaurant.find(params[:rst_id])
    current_user.liked(params[:group_id], @rst)
    #flash[:success] = '行きたいに追加しました'
    #redirect_to group_restaurants_url(params[:group_id])
  end

  def destroy
    @group = Group.find(params[:group_id])
    @rst = Restaurant.find(params[:rst_id])
    current_user.unliked(params[:group_id], @rst)
    #flash[:success] = '行きたいを解除しました'
    #redirect_to group_restaurants_url(params[:group_id])
  end
end
