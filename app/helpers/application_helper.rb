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

  #当前进度
  def progressBar(num, total)
    ((num.round(2) / total) * 100).to_i
  end

end
