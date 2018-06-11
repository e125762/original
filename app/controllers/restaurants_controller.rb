class RestaurantsController < ApplicationController
  def index
    @areas = Area.all
#    @group = params[:group_id]
    if params[:q]
    if params[:q][:area].present? && params[:search].present?
      @restaurants = Area.find(params[:q][:area]).restaurants.search(params[:search]).score_desc
    elsif params[:q][:area].present? && !params[:search].present?
      @restaurants = Area.find(params[:q][:area]).restaurants.score_desc
    elsif !params[:q][:area].present? && params[:search].present?
      @restaurants = Restaurant.search(params[:search]).score_desc
    else
      @restaurants = Restaurant.score_desc.all
    end
    end
  end
end
