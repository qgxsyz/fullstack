class PostsController < ApplicationController

  def show
    begin
      @course = Course.find(params[:id])
      @section = Section.find(params[:id])
    rescue Exception => e
      render :template => "error/404/index.html.erb" #异常跳转
    else
    end
  end
end
