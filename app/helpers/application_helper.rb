module ApplicationHelper
  def title(page_title)
    content_for :title, page_title.to_s
  end

  def himage(page_himage)
    content_for :himage, page_himage.to_s
  end

  def back_arrow(page_back_arrow)
    content_for :back_arrow, page_back_arrow.to_s
  end
end
