## Trackathon
An app for giving an overview of projects status' during a hackathon


### Context
This was built as our final project at [Maker's Academy](www.makersacademy.com), over two weeks of blood, sweat, tears, sweary commits and high-fives.

The project was pitched by [Spike](https://github.com/spike01).


### Team

* Alex Fakhri: [alexfakhri](https://github.com/alexfakhri)
* Camilla van Klinken: [camillavk](https://github.com/camillavk)
* Ella Schofield: [ellanancyfay](https://github.com/EllaNancyFay)
* Victoria Barr: [barr-code](https://github.com/barr-code)
* Yvette Cook: [yvettecook](https://github.com/yvettecook)

### Tools

* Ruby version
* Gems - development
* Gems - testing
* System dependencies

* Dashing-Rails

For more information see [dashing.io](http://dashing.io/)


### Installation

`git clone`
`bundle install`

Ensure you have PostgresQL installed (link)
Install Redis (this should happen on Gemfile - why doesn't it?)

* Configuration

secrets.yml - create and populate

* Database creation & initialization

`bin/rake db:create db:migrate`



* How to run the test suite


Install [Firefox](https://www.mozilla.org/en-GB/firefox/new/)
bin/rake RAILS_ENV=test db:create db:migrate

* Configuration

secrets.yml - create and populate

* Database creation & initialization

`bin/rake db:create db:migrate`

* How to run the test suite

Install [Firefox](https://www.mozilla.org/en-GB/firefox/new/)

To run non JavaScript tests use: rspec spec -t ~js

Jasmine Tests:

* either http://localhost:3000/specs or

`$ RAILS_ENV=test bundle exec rake spec:javascript`


* Deployment instructions




### Learnings



### Thanks to

* Leo
* Dave
* Spike
* Sam

* All the team at Makers Academy
