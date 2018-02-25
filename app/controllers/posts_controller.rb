class PostsController < ApplicationController
  before_action :authenticate_user!
  def show
    @section = Section.find(params[:id])
    @course = @section.chapter.course
    @chapters = @course.chapters

    # 分页 功能
    pageArr = []
    @chapters.each do |chapter|
      chapter.sections.each do |section|
        pageArr.push(section.id)
      end
    end

    @prevPage = ''
    @nextPage = ''
    currentPage = params[:id].to_i
    len = pageArr.length.to_i - 1
    pageArr.each_index do |i|
      if currentPage == pageArr[i]
        if i == 0
          @nextPage = pageArr[i+1]
        elsif i == len
          @prevPage = pageArr[i-1]
        else
          @prevPage = pageArr[i-1]
          @nextPage = pageArr[i+1]
        end
        #再学习多少节就可以完成本章了
        @hasSection = len - i
        break
      end
    end
    # 分页 功能 end

  end

  def add_to_favorite
    @section = Section.find(params[:id])
    @section.users << current_user
    @section.save
    redirect_to :back
  end
  def quit_favorite
    @section = Section.find(params[:id])
    @section.users.delete(current_user)
    @section.save
    redirect_to :back
  end

end
