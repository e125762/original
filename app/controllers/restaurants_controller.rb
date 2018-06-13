class RestaurantsController < ApplicationController
  before_action :require_group_join

  def index
    @group = Group.find(params[:group_id])
    @areas = Area.all
    @total = Restaurant.count
    if params[:q]
      if params[:q][:area].present? && params[:search].present?
        @hits = Area.find(params[:q][:area]).restaurants.search(params[:search]).count
        @restaurants = Area.find(params[:q][:area]).restaurants.search(params[:search]).score_desc.page(params[:page]).per(5)
      elsif params[:q][:area].present? && !params[:search].present?
        @hits = Area.find(params[:q][:area]).restaurants.count
        @restaurants = Area.find(params[:q][:area]).restaurants.score_desc.page(params[:page]).per(5)
     elsif !params[:q][:area].present? && params[:search].present?
        @hits = Restaurant.search(params[:search]).count
        @restaurants = Restaurant.search(params[:search]).score_desc.page(params[:page]).per(5)
      else
       @hits = Restaurant.count
       @restaurants = Restaurant.score_desc.page(params[:page]).per(5)
      end
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end
