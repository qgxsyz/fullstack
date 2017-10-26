class TasksController < ApplicationController
  def show
    @assignment = Assignment.find(params[:id])
    @chapter = @assignment.section.chapter
    @course = @chapter.course
  end
end
