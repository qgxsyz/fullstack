class DashboardController < ApplicationController

  def index
    if params[:category] == 'basic'
      @courses = Course.where("category = 'basic'")

    elsif params[:category] == 'major'
      @courses = Course.where("category = 'major'")

    elsif params[:category] == 'optional'
      @courses = Course.where("category = 'optional'")

    else
      @courses = Course.all
    end
  end

end
