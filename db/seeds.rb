puts 'Seeding data for MattRayner.co.uk...'

if Rails.env.production?
  puts "\nWHOOPS! You're not allowed to seed like this on production! That's hella dangerous."
  raise 'Seed Error: You are not allowed to seed on production'
end

def create_user(email:, password:)
  puts "\t\t- #{email}"

  user = User.find_or_initialize_by(email: email)

  puts( user.new_record? ? "\t\t\t- Creating..." : "\t\t\t- Already Exists - Updating..." )

  user.password              = password
  user.password_confirmation = password
  user.save!
end

def create_project(title:, intro:, body:, attachments: 0)
  puts "\t\t- #{title}"

  project = Project.find_or_initialize_by(title: title)

  puts( project.new_record? ? "\t\t\t- Creating..." : "\t\t\t- Already Exists - Updating..." )

  project.intro = intro
  project.body  = body

  project.save!

  if attachments.to_int > 0
    (0..attachments.to_int).each do |attachment|
      gallery_image = ProjectGalleryImage.new
      gallery_image.project = project
      gallery_image.title = "Gallery Image ##{attachment+1}"

      File.open('spec/support/files/test_cat.png') do |f|
        gallery_image.image = f
      end

      gallery_image.save!
    end
  end
end

puts "\t- Seeding users"
create_user(email: 'admin@example.com', password: 'mj$jCh@%mvhhNbpn!IXKZPWD66Fs0LOkfkuw^VOtwU@x&@57KTAmqjh*w2ZGa%FJI8jl0lws*r2rcsE2&6Jq$k5jEPBNd^M$VB6S')

puts "\t- Seeding projects"
create_project(title: 'Give Cat', intro: 'News websites getting you **down**? Can\'t face *another* look at 9gag? Or are you just fed up of looking at your friend\'s ***ugly***{: style="color: red"} faces?', body: 'Inspired by [Hey Girl](http://heygirl.io/), GiveCat was a side-project spawned from love and challenge.

Conceived in a university library after too many red bulls, I wanted to create a cute bookmark powered by an API and content management system.

##But why?

That\'s a good question... I noticed one *major* (to me anyway) flaw with Hey Girl. The image selection.
Hard coded into Hey Girl is an array of 20 something images that the bookmarklet selects at random and uses. This seemed a but too small for me. I wanted to **never** run out of ossum cute things.', attachments: 4)
create_project(title: 'Megafone', intro: 'A full e-commerce solution for a small remote mobile repair service.', body: 'A bit of body', attachments: 6)