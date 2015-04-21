Navigation = {}
window.Navigation = Navigation

Navigation.update_position = ->
  scroll_position = $(window).scrollTop()
  breadcrumb_height = $('.breadcrumbs').height()

  top = breadcrumb_height - scroll_position

  add_class = if top > 0 then true else false

  if add_class
    $('nav.navbar-fixed-top').addClass('sticky')
  else
    $('nav.navbar-fixed-top').removeClass('sticky')

jQuery ->
  $(window).scroll ->
    Navigation.update_position()

  Navigation.update_position()