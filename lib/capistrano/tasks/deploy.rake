namespace :deploy do
  before :deploy, "setup:imagemagick"
end