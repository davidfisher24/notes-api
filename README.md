## Requirements

 - ruby >= 2.5
 - rails >= 5.0
 - postgres

## Install

bundle install
rails db:create
rails db:migrate
rails s

## Test command

bundle exec rspec spec -fd

## Endpoints

POST /signup	Register user
POST /auth/login	Login User
GET /notes	List all current users notes
POST /note	Create a new note
GET /notes/:id	Get a note
PUT /notes/:id	Update a note
DELETE /notes/:id	Delete a a note
POST /notes/:id/share/:user	  Share a note with another user
DELETE /notes/:id/share/:user  Remove a note share with another user
GET /shares   Get all notes shared with current user
 