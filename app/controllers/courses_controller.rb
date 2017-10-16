class CoursesController < ApplicationController

  def show
    @course = Course.find(params[:id])
    # @chapters = @course.chapters
  end

  def get_syllabus
    begin
      @course = Course.find(params[:course_id])
    rescue Exception => e
      render :template => "error/404/index.html.erb" #异常跳转
    else
      @chapters = @course.chapters
      render :template => "/courses/syllabus.html.erb"
    end
  end
end
