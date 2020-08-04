# Sellar Champ
## Dependencies
* Ruby version : 2.5.0
* Rails Version : 6.0.2
* Yarn Version : 1.21.1
* Node Version : 11.13.0
## Configuration
```gem install bundler && bundle install```
```yarn install```
## Setup and Start the Applicaton
### Database Setup
```rake db:create && rake db:migrate && rake db:seed```
### Run the rails server
```rails s```
## Test Environment Setup
### Test Database Setup
```RAILS_ENV=test rake db:create && RAILS_ENV=test rake db:migrate```
### Run the Test Suit
```rspec```
