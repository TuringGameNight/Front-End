# Game Night

[![Build Status](https://travis-ci.com/TuringGameNight/Front-End.svg?branch=main)](https://travis-ci.com/TuringGameNight/Front-End)

[Production URL](https://aqueous-chamber-62045.herokuapp.com/)

Plan your next game night with GameNight! With this app you can add games to your shelf, get your friends to do the same, and when it is time to plan a game night, leave the planning to us. We will get all the games collated and allow your party to vote on the game(s) you want to play before the game night!

![gamenight-logo2](https://user-images.githubusercontent.com/4582791/104680627-925f9280-56ad-11eb-9f2e-379b773a6320.png)

## Table of Contents

  - [Technology](#technology)
  - [How to Install](#how-to-install)
  - [Features](#features)
  - [Database](#database)
  - [Testing](#testing)
  - [Known Issues](#known-issues)
  - [Roadmap](#roadmap)
  - [Contributors](#contributors)
  - [Acknowledgments](#acknowledgments)


## Technology

This app is built on Ruby 2.5 and Rails 5.2 with support from:
- Faraday
- Figaro
- Omniauth (Google Specific)
- Bootstrap
- Active Record Session Store
- Action Pack Caching
- and a host of testing gems

## How to Install

To install and run this application locally:

1. To setup the repository locally, clone it down and run the following commands:
```
$ bundle install
$ figaro install
$ rails db:{create,migrate}
```

2. In the `application.yml` file, the following lines:
```
BACKEND_URL: https://calm-journey-65417.herokuapp.com/
GOOGLE_CLIENT_ID: add_your_own
GOOGLE_CLIENT_SECRET: add_your_own
```
If you know a contributor, you can ask one of us for the client ID and secret.

3. In your terminal, startup your server with the `$ rails server` command

4. You should now be able to open your web browser, navigate to `http://localhost:3000/`.

## Features

[ADD VIDEO]

### Google OAuth
Authentication is taken care of by Google OAuth. Users may login with their Google account info by using the link on the home page.

### User Features
After authenticating/logging in, a user is taken to their dashboard where they can do the following:

    * Create game nights and accept/decline game night invites
    * Add friends, and accept/decline friend requests
    * View and add games to their shelf

### Game Search

    * A user can search for games and add games they own to their account or "shelf".
    * If the game they searched for is not displayed, they can add it manually.

## Database

All data is handled by our backend API [here](https://github.com/TuringGameNight/Back-End)

Our API calls are handles by our microservice Sinatra App [here](https://github.com/TuringGameNight/Sinatra)

## Testing

**Testing status:** As of 1/14/2021, this repo is at 97.68% coverage, per SimpleCov

**How to run the test suite**

- Run `bundle exec rspec`

## Known Issues

- Update FE tests to align with backend
- Add more sad path testing
- Users can see the game nights they are not invited to
- The user's list of games in the session doesn't immediately update when they add a game
- Due to the above, you can add more than one of the same game
- Selecting people to invite doesn't translate to the game night creation, all user friends are added.

## Roadmap

Features we would like to build in the future include:

1. Voting on games for the game night
1. Notification of the game owner to bring the game the day of
1. Chat feature with friends
1. Add location of game night
1. Google maps for directions to location
1. Game night stats (Games played the most, hall of fame)
1. Game night photos and memorabilia
1. Notifications by email of voting, reminders, invites, etc.
1. Google calendar invite integration to add to your calendar
1. Find a good night based on friend's calendars or voting on a day
1. Save favorite friend groups
1. Schedule regular game nights
1. Private/public game nights
1. Virtual game night option
1. Signup to bring food
1. Reviews and comments on games you own
1. Custom tagging of games

## Contributors

- Austin Aspaas - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/austin-aspaas-4626611bb/) - [![GitHub][github-shield]](https://github.com/evilaspaas1)
- Eduardo Parra - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/eduardo--parra/) - [![GitHub][github-shield]](https://github.com/helloeduardo)
- Garrett Cottrell - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/garrett-cottrell-52850834/) - [![GitHub][github-shield]](https://github.com/GarrettCottrell)
- Grant Dempsey - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/grant-dempsey-8a9a16169/) - [![GitHub][github-shield]](https://github.com/GDemps)
- Greg Mitchell - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/gregory-j-mitchell/) - [![GitHub][github-shield]](https://github.com/GregJMitchell)
- Kate Tester - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/katemorris/) - [![GitHub][github-shield]](https://github.com/katemorris)
- Philip DeFraties - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/philip-defraties/) - [![GitHub][github-shield]](https://github.com/PhilipDeFraties)
- Shaun James - [![LinkedIn][linkedin-shield]](https://github.com/ShaunDaneJames) - [![GitHub][github-shield]](https://www.linkedin.com/in/shaun-james-2707a61bb/)
- Shaunda Cunningham - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/shaunda-cunningham/) - [![GitHub][github-shield]](https://github.com/smcunning)
- Taylor Phillips - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/taphill/) - [![GitHub][github-shield]](https://github.com/taphill)

## Acknowledgments

Thank you to the [Board Game Atlas API](https://www.boardgameatlas.com/api/docs) for providing the board game data that this project relies on.

<!-- MARKDOWN LINKS & IMAGES -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[github-shield]: https://img.shields.io/badge/-GitHub-black.svg?style=flat-square&logo=github&colorB=555
