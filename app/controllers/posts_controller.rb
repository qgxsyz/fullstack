class PostsController < ApplicationController

  def show
    begin
      @section = Section.find(params[:id])
      @course = @section.chapter.course
    rescue Exception => e
      render :template => "error/404/index.html.erb" #异常跳转
    else
    end
  end
end
