class Admin::AssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

  def index
    @assignments = Assignment.all
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy
    redirect_to admin_section_assignments_path
  end

  def new
    @section = Section.find(params[:section_id])
    @assignment = Assignment.new
  end

  def create
    # 关联到节
    @section = Section.find(params[:section_id])
    @assignment = Assignment.new(assignment_params)
    @assignment.section = @section

    if @assignment.save
      # 创建章节后返回
      redirect_to admin_section_path(@section)
      flash[:notice] = "创建成功！"
    else
      render :new
      flash[:warning] = "创建失败！#{ @assignment.errors.full_messages }"
    end
  end

  def edit
    @section = Section.find(params[:section_id])
    @assignment = Assignment.find(params[:id])
  end

  def update
    @section = Section.find(params[:section_id])
    @assignment = Assignment.find(params[:id])
    if @assignment.update(assignment_params)
      redirect_to admin_section_path(@section)
    else
      render :edit
    end
  end

  private
  def assignment_params
    params.require(:assignment).permit(:assignment_name, :description)
  end
end
