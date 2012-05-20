class PointsController < ApplicationController
  def create
    if current_user
      @point = Point.new(user: current_user, pointable_id: params[:item_id], pointable_type: params[:item_type])
      if @point.save
        session[:point_for] = nil
        redirect_to :root, :notice => "You made some points. Rock on!"
      else
        redirect_to :root, :alert => "You've already pointed this item"
      end
    else
      session[:point_for] = params[:item_id]
      session[:point_for_type] = params[:item_type]
      redirect_to login_url(:subdomain => false), :alert => "Please log in or sign up first."
    end
  end
end
