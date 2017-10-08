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
end
