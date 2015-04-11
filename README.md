# Matt Rayner [![CircleCI](https://img.shields.io/circleci/project/mattrayner/mattrayner.svg)](https://circleci.com/gh/mattrayner/mattrayner) [![Code Climate](https://codeclimate.com/github/mattrayner/mattrayner/badges/gpa.svg)](https://codeclimate.com/github/mattrayner/mattrayner)  [![Test Coverage](https://codeclimate.com/github/mattrayner/mattrayner/badges/coverage.svg)](https://codeclimate.com/github/mattrayner/mattrayner) [![Inline docs](http://inch-ci.org/github/mattrayner/mattrayner.svg?branch=master)](http://inch-ci.org/github/mattrayner/mattrayner)
[![Matt Rayner - Full Stack Rubyist Based in London](http://i.imgur.com/TWtbNnG.png)](http://mattrayner.co.uk/)

This repo contains my full portfolio website, including the custom CMS. It is published as an example of my work.
It includes continuous integration and delivery using [Circle CI](https://circleci.com/gh/mattrayner/mattrayner) along with Capistrano (see the included [configuration](circle.yml) file)

## Installation and Setup
**NOTE:** This application has been developed with Ruby version [2.2.1](https://www.ruby-lang.org/en/news/2015/03/03/ruby-2-2-1-released/) and Rails version [4.2](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/). Please ensure these are installed before installing and setting up the application.

Clone the project to your local machine and navigate into it:

```bash
$ git clone git@github.com:mattrayner/mattrayner.git
$ cd mattrayner
```

Install ImageMagick for image resizing

```bash
$ brew install imagemagick
```

Copy environment template

```bash
$ cp .env.sample .env
```

**Note:** To update external API data, please ensure you fill in the .env file with applicable data.

Install all of the GEM dependencies with [bundler](http://bundler.io/):

```bash
$ bundle install
```

Set up the local database:

```bash
$ bundle exec rake db:create db:setup db:seed
```

Ensure that the test suite successfully runs on your local machine:

```bash
$ bundle exec rake db:test:prepare && bundle exec rspec
```

Finally, launch the application:

```bash
$ bundle exec rails s
```

You should now be able to see a local version of the project at http://localhost:3000. You can access the admin panel at http://localhost:3000/admin

## Demo
This application can be found at http://mattrayner.co.uk running the master branch bose base.

You can see a **DEVELOPMENT** version of this project at http://dev.mattrayner.co.uk/ 
**THIS SERVICE MAY NOT BE AVAILABLE 100% OF THE TIME**

## Contributing
If you wish to submit a bug fix, you can create a pull request and it will be merged pending a code review.

1. Clone it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

If you have a feature request please submit an [issue](http://github.com/mattrayner/mattrayner/issues) and it will be prioritised.