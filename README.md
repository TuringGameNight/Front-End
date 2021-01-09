# Game Night
Game Night is an app for organizing tabletop game nights amongst groups of friends. Users create "Game Nights" that set a date and time for the event and send invites to friends selected. 


## Getting Started

* Ruby version: `2.5.3`

* Rails Version `5.2.4.3`

Run `bundle install` Run `figaro install`

Add the TuringGameNight-API URL to the application.yml file


## Features

* Authentication is taken care of by Google OAuth. Users may login with thier Google account info by using the link on the home page.
* After authenticating/logging in, a user is taken to thier dashboard where they can do the following: 
    * Create game nights
    * Add friends
    * View and add to thier game shelf
* Searching for games:
    * A user can search for games and add them to thier shelf
    * If thier game is not displayed, they can add it manually.

* Database creation
    * All data is handled by our backend API [here](https://github.com/TuringGameNight/Back-End)
* How to run the test suite
    * To run our test suite, run `bundle exec rspec`

* Services (job queues, cache servers, search engines, etc.)
    * Our board games data is provided by [Board Game Atlas](https://api.boardgameatlas.com/) (Docs [Here](https://api.boardgameatlas.com/api/docs))
    * Our API calls are handles by our microservice Sinatra App [here](https://github.com/TuringGameNight/Sinatra)
