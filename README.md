# Project: Rales Engine 

This is a Ruby on Rails application used to organize YouTube content used for online learning. Each tutorial is a playlist of video segments. Within the application an admin is able to create tags for each tutorial in the database. A visitor or registered user can then filter tutorials based on these tags.

A visitor is able to see all of the content on the application but in order to bookmark a segment they will need to register. Once registered a user can bookmark any of the segments in a tutorial page.

## Objective and Implementation 
This solo project was completed in 7 days as a requirement for Module 2 at Turing School of Software and Design.

The project was built using Rails which implements the following:

Consume a JSON API
Build an app that authenticates using OAuth
Make API calls to an authenticated API
Build on top of brownfield code
Empathy for developers facing deadlines
Empathy for teammates that might work with your code in the future (or future you!)
Prioritize what code is relevant to your immediate task (and ignore the rest)
Send email from a Rails application

## Contributors
- Sarah Tatro

## System Requirements
- Rails 5.x
- ActiveRecord - PostgreSQL

## Gems Used
- Bcrypt
- Capybara
- FactoryBot
- Launchy
- Pry
- RSpec
- Shoulda Matchers
- Simplecov

## GitHub Repository
https://github.com/ktsune/rails_engine

## Instructions

#### How to setup:
    1. Run `bundle`
    2. Run rake db:{create,migrate,seed}
    3. Run `rake import`
    4. Run rails s, visit localhost:3000 to view the app and navigate on your local server.
#### Run tests:
    1. Run rspec.
    2. To run an individual test, type rspec and the full path to the test file into the command line.
