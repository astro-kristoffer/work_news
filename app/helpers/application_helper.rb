module ApplicationHelper
  # Возвращает полный заголовок на основе заголовка старницы.
  def full_title(page_title = '')
    base_title = "Astro News"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
