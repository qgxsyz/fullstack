class PostsController < ApplicationController

  def show
    begin
      @section = Section.find(params[:id])
      @course = @section.chapter.course
      @section2 = @course.chapters
      
      @currentId = params[:id]
      @firstId = @course.chapters.first.sections.first.id
      @lastId = @course.chapters.last.sections.last.id
      @next = Section.offset(1)
      puts params[:id]
      puts @section.chapter.sections.count
    rescue Exception => e
      render :template => "error/404/index.html.erb" #异常跳转
    else
    end
  end
end
