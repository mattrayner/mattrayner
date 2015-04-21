# Namespace for a set of helper methods available within the application.
# @since 0.6.0
module ApplicationHelper
  # Take a string of MarkDown and convert it to HTML
  #
  # @author Matthew Rayner
  #
  # @see http://kramdown.gettalong.org/quickref.html Examples of MarkDown.
  #
  # @param [String] source the MarkDown to be converted.
  #
  # @example Convert a MarkDown title to a H1 HTML tag
  #   markdown("#Some Title") #=> "<h1 id='some-title'>Some Title</h1>"
  #
  # Only a sub-set of HTML tags are allowed. Some mark down elements are
  # completely ignored.
  #
  # @return [String] the converted HTML.
  def markdown(source)
    # Strip any existing HTML tags from the MarkDown source
    #   Prevents HTML injection by the user.
    source = sanitize(source, tags: [])
    Kramdown::Document.new(source).to_html.html_safe
  end

  # Take an array of hashes, and build a string of HTML representing breadcrumbs
  #
  # @author Matthew Rayner
  #
  # @param [Array] An array of hashes representing steps in a breadcumb trail.
  #   #=> [
  #         {title: 'A Page', url: '/a/path/'},
  #         {title: 'Another Page', url: '/yet/another/path/'}
  #       ]
  #
  # @example Given a single element call, generate a two level breadcrumb
  #   build_breadcrumbs([{title: 'A title', url: '/a/path/'}]) #=> "<div ite..."
  #
  # @return [String] A html_safe string representing the breadcrumb code
  def build_breadcrumbs(*crumbs)
    crumbs = [] if crumbs == [nil]

    full_crumbs = ([{ title: 'Matt Rayner', url: root_url }] + crumbs).flatten

    build_breadcrumb(full_crumbs, root: true)
  end

  # What should the HTML class value be for the 'Home' navigation element?
  #
  # @author Matthew Rayner
  #
  # @return [String] A string or nil
  def home_nav_class
    return 'active' if home_controller?
  end

  # What should the HTML class value be for the 'Case Studies' navigation
  # element?
  #
  # @author Matthew Rayner
  #
  # @return [String] A string or nil
  def case_studies_nav_class
    return 'active' if case_studies_controller?
  end

  # What should the HTML class value be for the 'Skills' navigation
  # element?
  #
  # @author Matthew Rayner
  #
  # @return [String] A string or nil
  def skills_nav_class
    return 'active' if skills_controller?
  end

  private

  # Take an array of crumbs and create a tree of HTML
  #
  # Will take an array and recursively generate nested HTML from the partial:
  #   shared/breadcrumb
  #
  # @author Matthew Rayner
  #
  # @param [Array] An array of hashes representing steps in a breadcrumb trail.
  #   #=> [
  #         {title: 'A Page', url: '/a/path/'},
  #         {title: 'Another Page', url: '/yet/another/path/'}
  #       ]
  #
  # @return [String] A string containing HTML representing a breadcrumb.
  def build_breadcrumb(crumbs, root: false)
    crumb = crumbs.shift

    child_crumb = crumbs.empty? ? '' : build_breadcrumb(crumbs)

    render(partial: 'shared/breadcrumb',
           locals: {
             crumb: crumb,
             children: child_crumb,
             root: root
           })
  end

  # Are we currently within the home controller?
  #
  # @author Matthew Rayner
  #
  # @return [Boolean] true or false
  def home_controller?
    params[:controller] == 'home'
  end

  # Are we currently within the case studies controller?
  #
  # @author Matthew Rayner
  #
  # @return [Boolean] true or false
  def case_studies_controller?
    params[:controller] == 'case_studies'
  end

  # Are we currently within the skills controller?
  #
  # @author Matthew Rayner
  #
  # @return [Boolean] true or false
  def skills_controller?
    params[:controller] == 'skills'
  end
end
