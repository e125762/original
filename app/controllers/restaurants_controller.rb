class RestaurantsController < ApplicationController
  def index
    @areas = Area.all
#    @group = params[:group_id]
    if params[:q]
    if params[:q][:area].present? && params[:search].present?
      @restaurants = Area.find(params[:q][:area]).restaurants.search(params[:search])
    elsif params[:q][:area].present? && !params[:search].present?
      @restaurants = Area.find(params[:q][:area]).restaurants
    elsif !params[:q][:area].present? && params[:search].present?
      @restaurants = Restaurant.search(params[:search])
    else
      @restaurants = Restaurant.all
    end
    end
  end
end
