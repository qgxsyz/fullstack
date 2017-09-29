class Admin::SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

  def index
    @chapter = Chapter.find(params[:chapter_id])
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    redirect_to admin_chapter_sections_path
  end

  def new
    @chapter = Chapter.find(params[:chapter_id])
    @section = Section.new
  end

  def create
    # 关联到章
    @chapter = Chapter.find(params[:chapter_id])
    @section = Section.new(section_params)
    @section.chapter = @chapter

    if @section.save
      # 创建章节后返回课程章节目录
      redirect_to admin_course_path(@chapter.course)
      flash[:notice] = "创建成功！"
    else
      render :new
      flash[:warning] = "创建失败！#{ @section.errors.full_messages }"
    end
  end

  def edit
    @chapter = Chapter.find(params[:chapter_id])
    @section = Section.find(params[:id])
  end

  def update
    @chapter = Chapter.find(params[:chapter_id])
    @section = Section.find(params[:id])
    if @section.update(section_params)
      redirect_to admin_course_path(@chapter.course)
    else
      render :edit
    end
  end

  private
  def section_params
    params.require(:section).permit(:section_name, :is_exist_video, :content)
  end
end
