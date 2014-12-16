[![Code Climate](https://codeclimate.com/github/yvettecook/Trackathon/badges/gpa.svg)](https://codeclimate.com/github/yvettecook/Trackathon)

![Trackathon](https://s3.amazonaws.com/uploads.hipchat.com/119067/1212857/vNc0XILVe2fKftp/Trackathon.png)
### *A simply dashing way to track hackathons*
Check it out at [dashing-trackathon.herokuapp.com](http://dashing-trackathon.herokuapp.com/)

![Screenshot of Dashboard](https://s3.amazonaws.com/uploads.hipchat.com/119067/1211572/S2dXxe41XTbfPdD/Screen%20Shot%202014-12-05%20at%2011.34.52%20%282%29.png)

### The Story behind Trackathon
On September 15th, 2014, the creators of Trackathon jumped straight into the deep end of the coding pool by starting their first day at [Maker's Academy](www.makersacademy.com). Ten weeks (and more technologies than we care to list) later, final project time rolled around. Makers' brave students were presented with many potential challenges, including that of providing a tool for tracking teams' progress throughout the course of a hackathon. Five unlikely heroes rose to that challenge, persevering through many coding hardships. After two weeks of blood, sweat, tears, and many cans of Pringles, our team is proud to unleash Trackathon upon the world.

Want to track your own hackathon? Go to the [site](http://dashing-trackathon.herokuapp.com/) and get started.

### Team

* Alex Fakhri: [alexfakhri](https://github.com/alexfakhri)
* Camilla van Klinken: [camillavk](https://github.com/camillavk)
* Ella Schofield: [ellanancyfay](https://github.com/EllaNancyFay)
* Victoria Barr: [barr-code](https://github.com/barr-code)
* Yvette Cook: [yvettecook](https://github.com/yvettecook)

![teamhigh-fives](https://s3.amazonaws.com/uploads.hipchat.com/119067/1212438/nA2DydJoswfWsIH/IMG_0172.JPG)

# Tools

*Languages:*
  * Ruby
  * Javascript
  * CoffeeScript


*Created with:*
  * Ruby on Rails (v4.1.7)
  * PostgresQL
  * [Dashing-Rails](https://github.com/gottfrois/dashing-rails)

*Tested with:*

  * RSpec
  * Capybara
  * Selenium
  * Jasmine

*Deployed with:*

  * Heroku
  * Puma
  * Redis-Server


# Installation

If you'd like to host to app yourself, follow the steps below.

1. Before download, install
  * PostgresQL
  * Redis-server


2. Download the code, and install the gems

  Run `$ git clone git@github.com:yvettecook/Trackathon.git`

  Then `$ bundle install`

3. *Configuration*

Create a `config/secrets.yml` file, and populate with:
      * secret_key_base
      * Twitter access tokens, if you wish to use to live twitter stream widget
      * GitHub authentication, if you wish to use GitHub logins

To create the database run `$ bin/rake db:create db:migrate`

4. *Testing*

Firefox must be installed in order for Selenium to run.

To run the rspec test scripts:

`$ chmod u+x testrunner.sh`
`$ ./testrunner.sh`

To run the jasmine unit tests either visit http://localhost:3000/specs or run

`$ RAILS_ENV=test bundle exec rake spec:javascript`
