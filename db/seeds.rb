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

def create_skill(title:, level:)
  puts "\t\t- #{title}"

  skill = Skill.find_or_initialize_by(title: title)

  puts( skill.new_record? ? "\t\t\t- Creating..." : "\t\t\t- Already Exists - Updating..." )

  skill.title = title
  skill.level = level

  File.open('spec/support/files/ruby_logo.svg') do |f|
    skill.svg_logo = f
  end

  File.open('spec/support/files/ruby_logo.png') do |f|
    skill.image_logo = f
  end

  skill.save!

  skill
end

def create_case_study(title:, intro:, body:, attachments: 0, skills: [])
  puts "\t\t- #{title}"

  case_study = CaseStudy.find_or_initialize_by(title: title)

  puts( case_study.new_record? ? "\t\t\t- Creating..." : "\t\t\t- Already Exists - Updating..." )

  case_study.intro = intro
  case_study.body  = body

  File.open('spec/support/files/test_cat.png') do |f|
    case_study.header_image = f
  end

  case_study.save!

  if attachments.to_int > 0
    (0..attachments.to_int).each do |attachment|
      gallery_image = CaseStudyGalleryImage.new
      gallery_image.case_study = case_study
      gallery_image.title = "Gallery Image ##{attachment+1}"

      File.open('spec/support/files/test_cat.png') do |f|
        gallery_image.image = f
      end

      gallery_image.save!
    end
  end

  skills.each do |skill|
    case_study.skills << skill
  end
end

def create_fit_bit_stat(steps:, floors:, age:)
  unless FitBitStats.find_by(steps: steps, floors: floors, created_at: age)
    puts "\t\t\t- Creating (steps: #{steps}, floors: #{floors})..."

    stat = FitBitStats.new(steps: steps, floors: floors)
    stat.created_at = age
    stat.save
  else
    puts "\t\t\t- Already Exists... Skipping"
  end
end

def create_cv
  if CurriculumVitae.count.zero?
    puts "\t\t\t- Creating..."

    cv = CurriculumVitae.new(note: 'Example CV')

    File.open('spec/support/files/pink_pdf.pdf') do |f|
      cv.file = f
    end

    cv.save
  else
    puts "\t\t\t- Already Exists... Skipping"
  end
end

puts "\t- Seeding users"
create_user(email: 'admin@example.com', password: 'mj$jCh@%mvhhNbpn!IXKZPWD66Fs0LOkfkuw^VOtwU@x&@57KTAmqjh*w2ZGa%FJI8jl0lws*r2rcsE2&6Jq$k5jEPBNd^M$VB6S')

puts "\t- Seeding Skills"
ruby_skill = create_skill(title: 'Ruby', level: 98.5)
php_skill  = create_skill(title: 'PHP', level: 55.4)
html_skill = create_skill(title: 'HTML', level: 100.0)

puts "\t- Seeding case studies"
create_case_study(title: 'Give Cat', intro: 'News websites getting you **down**? Can\'t face *another* look at 9gag? Or are you just fed up of looking at your friend\'s ***ugly***{: style="color: red"} faces?', body: 'Inspired by [Hey Girl](http://heygirl.io/), GiveCat was a side-project spawned from love and challenge.

Conceived in a university library after too many red bulls, I wanted to create a cute bookmark powered by an API and content management system.

##But why?

That\'s a good question... I noticed one *major* (to me anyway) flaw with Hey Girl. The image selection.
Hard coded into Hey Girl is an array of 20 something images that the bookmarklet selects at random and uses. This seemed a but too small for me. I wanted to **never** run out of ossum cute things.', attachments: 4, skills: [ruby_skill, html_skill])
create_case_study(title: 'Megafone', intro: 'A full e-commerce solution for a small remote mobile repair service.', body: 'A bit of body', attachments: 6, skills: [php_skill, html_skill])

puts "\t- Seed FitBit data..."
create_fit_bit_stat(steps: 0, floors: 0, age: 75.minutes.ago)
create_fit_bit_stat(steps: 123, floors: 1, age: 60.minutes.ago)
create_fit_bit_stat(steps: 456, floors: 2, age: 45.minutes.ago)
create_fit_bit_stat(steps: 789, floors: 3, age: 30.minutes.ago)
create_fit_bit_stat(steps: 1011, floors: 4, age: 15.minutes.ago)

puts "\t- Seed CVs..."
create_cv