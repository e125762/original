class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def require_group_join
    if params[:controller] == "groups"
      group = Group.find_by(id: params[:id])
    else
      group = Group.find_by(id: params[:group_id])
    end

    unless current_user.joind?(group)
      redirect_to root_url
    end
  end
end
