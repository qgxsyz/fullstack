class PostsController < ApplicationController

  def show
    @course = Course.find(params[:id])
    @chapters = @course.chapters
  end
end
