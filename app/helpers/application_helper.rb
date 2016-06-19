module ApplicationHelper
  def render_page_header(header)
    content_tag :div, class: 'page-header' do
      content_tag :h1, header.capitalize
    end
  end
  
  def render_error_messages(obj)
    if obj.errors.any?
      render 'shared/error_messages', object: obj
    end
  end
end
