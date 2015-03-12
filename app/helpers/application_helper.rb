module ApplicationHelper
  def markdown(source)
    source = sanitize(source, tags: [])
    Kramdown::Document.new(source).to_html.html_safe
  end
end
