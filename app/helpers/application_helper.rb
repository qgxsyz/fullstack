module ApplicationHelper

  # 设置动态变化的网页标题
  def title(page_title)
    content_for(:title) { page_title }
  end

  def is_active?(category_name)
    "active" if params[:category] == category_name
  end

  def is_all_course?
    "active" if params[:category] ==  nil
  end

  #每个 课程预计学习时间
  def totalLearningTime(chapters)
    total_time = 0 #总时间
    chapters.each do |chapter|
      total_time += chapter.learning_time
    end
    total_time
  end

  #每个 课程总作业数
  def totalAssignments(chapters)
    total_assignment = 0 #课程作业数
    chapter_assignment = 0 #章作业数
    chapters.each do |chapter|
      chapter.sections.each do |section|
        chapter_assignment += section.assignments.length
      end
    end
    total_assignment += chapter_assignment
  end

end
