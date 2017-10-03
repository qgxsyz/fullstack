module ApplicationHelper

  # 设置动态变化的网页标题
  def title(page_title)
    content_for(:title) { page_title }
  end

end
