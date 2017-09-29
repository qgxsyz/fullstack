class Admin::ChaptersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

  def index
    @course = Course.find(params[:course_id])
    @chapters = Chapter.all
  end

  def show
    @chapter = Chapter.find(params[:id])
  end

  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy

    redirect_to admin_course_path(@course)
  end

  def new
    @course = Course.find(params[:course_id])
    @chapter = Chapter.new
  end

  def create
    # 关联到课程
    @course = Course.find(params[:course_id])
    @chapter = Chapter.new(chapter_params)
    @chapter.course = @course

    if @chapter.save
      # redirect_to admin_course_chapters_path
      # 创建章节后返回课程章节目录
      redirect_to admin_course_path(@course)
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:course_id])
    @chapter = Chapter.find(params[:id])
  end

  def update
    @chapter = Chapter.find(params[:id])

    if @chapter.update(chapter_params)
      redirect_to admin_course_path(@chapter.course)
    else
      render :edit
    end
  end

  private
  def chapter_params
    params.require(:chapter).permit(:chapter_name)
  end
end
