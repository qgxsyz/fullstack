class Admin::CoursesController < ApplicationController
  layout 'admin'


  def new
    @course = Course.new
  end

  def create
   @course = Course.new(course_params)

   if @course.save
     redirect_to admin_dashboard_path
   else
     render :new
   end
 end

 def edit
  @course = Course.find(params[:id])
end

def update
  @course = Course.find(params[:id])
  if @course.update(course_params)
    redirect_to admin_dashboard_path
  else
    render :edit
  end
end

def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to admin_dashboard_path
  end


 private

 def course_params
   params.require(:course).permit(:course_name, :category, :is_locked, :course_img)
 end

end
