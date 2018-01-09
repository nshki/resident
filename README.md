Resident
========

A private apartment complex network where residents can communicate with other renters. This app was originally developed because of my own frustration in my apartment's management and lack of transparency of issues throughout buildings.


## Private Network?

Currently, the app doesn't allow open sign ups, meaning you can only create an account by being given a unique invite code. This obviously limits the amount of apartment complexes the app can be used at, but the intention is to test it at my own complex first to see if residents find this remotely useful.

If this sees a decent amount of use, I'd like to open source this project and rethink the invite/sign up process.


## Local Setup

Get Ruby and gems setup:

```
rbenv install
gem install bundler
bundle install
```

Configure environment variables (this is important):

```
cp .env.sample .env
```

Create databases, load schema, and seed up (the app uses PostgreSQL):

```
bin/rake db:create
bin/rake db:schema:load
bin/rake db:seed
```

Give it a whirl:

```
bin/rails s

# The seeded invite code is `secretinvitecode`. You can view the invite sign up
# at `/invite/secretinvitecode`. From there, you can create your first account.
```


## Testing

For this project, Minitest is being used instead of RSpec to take advantage of the Rails 5.1 test suite updates. Capybara ships out of the box and Rails system tests make feature testing feel like home.

Make sure to [install PhantomJS](http://phantomjs.org/) on your machine before running tests. That is the current headless driver being used.

```
bin/rake test
bin/rake test:system
```

Trying to follow a Thoughtbot-inspired testing methodology for this project, where system tests will only get written for "happy paths," or in other words, successful user flows, and controller tests will only get written for "sad paths," or erroneous user flows.
