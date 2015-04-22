Skill = {}
window.Skill = Skill

Skill.Logo = {}
window.Skill.Logo = Skill.Logo

Skill.Logo.set_logo_backgrounds = ->
  $('.skill-circle.data-svg-image').each( ->
    svg_logo = $(this).data('svg-image')
    image_logo = $(this).data('image')

    if svg_logo != null && image_logo != null
      $(this).attr('style', "background-image: url(#{image_logo}); background-image: url(#{svg_logo}), none;")
  )

Skill.Logo.setup_tooltips = ->
  $('.skill-circle.content-tooltip').each( ->
    title = $(this).text()

    $(this).attr('title', title).tooltip()
  )

$(document).ready( ->
  Skill.Logo.set_logo_backgrounds()
  Skill.Logo.setup_tooltips()
)