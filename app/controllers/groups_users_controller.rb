# -*- coding: utf-8 -*-
class GroupsUsersController < ApplicationController
  before_action :require_user_logged_in

  def create
    @group = Group.find(params[:group_id])
    current_user.follow(@group)
    #flash[:success] = 'グループに参加しました'
    #redirect_to groups_url
  end

  def destroy
    @group = Group.find(params[:group_id])
    current_user.unfollow(@group)
    #flash[:success] = 'グループから抜けました'
    #redirect_to groups_url
  end
end
