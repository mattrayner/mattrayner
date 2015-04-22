Listing = {}
window.Listing = Listing

Listing.set_images = ->
  $('.full-bleed-image.listing.data-image').each( ->
    image_url = $(this).data('image')

    if image_url != null
      $(this).css('background-image', "url(#{image_url})")
  )

$(document).ready( ->
  Listing.set_images()
)