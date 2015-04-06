# Namespace for a set of helper methods available within the application.
# @since 0.6.0
module ApplicationHelper
  # Take a string of MarkDown and convert it to HTML
  #
  # @author Matthew Rayner
  #
  # @see http://kramdown.gettalong.org/quickref.html Examples of accepted MarkDown
  #
  # @param [String] source the MarkDown to be converted
  #
  # @example Convert a MarkDown title to a H1 HTML tag
  #   markdown("#Some Title") #=> "<h1 id='some-title'>Some Title</h1>"
  #
  # Only a sub-set of HTML tags are allowed. Some mark down elements are completely ignored.
  #
  # @return [String] the converted HTML
  def markdown(source)
    # Strip any existing HTML tags from the MarkDown source
    #   Prevents HTML injection by the user.
    source = sanitize(source, tags: [])
    Kramdown::Document.new(source).to_html.html_safe
  end
end
