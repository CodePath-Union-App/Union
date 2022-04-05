CodePath iOS Group Project
===

# Union

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Union is an app that serves as an alternative way of finding people to play with. As awesome as platforms such as Discord and Reddit are for finding communities in the games that we love and play, sometimes these servers and reddit forums can set out to do multiple things at once. If you have ever joined a community on one of these platforms, you will see that often times they are littered with off-topic  channels and are very multi-purpose. This can be a pain-point if your primary intention for joining in the first place is for LFG (Looking for Group). Union serves to eliminate this pain-point by having our platform prioritize the games and the people who play them.

### App Evaluation

- **Category:** Social Networking / Gaming
- **Mobile:** Union will be developed with a "mobile-first" mindset, but absolutely has room for expansion outside of just your mobile devices.
- **Story:** Union will serve as a platform for Gamers to find people to play and connect with. It can be with practice in mind (if you’re a competitive player), with forming a team in mind (if you have Esports aspirations), or even with casual-play in mind (if you seek someone for a cooperative experience).
- **Market:** According to eMarketer at InsiderIntelligence, the number of Digital Gamers will reach over 179 million this year in the US alone. Union is marketable to every single one of those people. The reason being is because Union serves as an alternative way of finding Gamers to connect with, regardless of whether you're considered a "hard-core" Gamer or not.
- **Habit:** Simply put, if you love gaming, you'll love Union. The usage our users get out of our app will be determined by how integral gaming is to their lives. If gaming is something someone does and talks about daily, then they have the potential to open up our app daily as well.
- **Scope:** Union will serve as an app that's used to connect users based on interests and game preferences. Outside the scope of bringing Gamers together to play, the app has the potential to also serve as a place of information gathering; becoming a resource for current events in the space of video-games (tailored to the users preferences).

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can register a new account
    * Select Avatar
    * Create Username
    * Create Password
    * Create Bio
    * Set Game Genre Preferences (First-Person Shooters, Fighting, Role-Playing, etc)
* User can login to their account
* View layout of game posters using a CollectionView based off the users preference
* User can tap a poster in the collection view to see a details screen of that game
* Display game details
* User can follow a game which adds it to the users profile
* User can input their connection purposes after following the game
* Display all users that follow this game
* Display each users connection purposes (Looking for Practice, Looking for Co-Op Partner, etc)
* Able to click on a user to see their user profile
* View avatar, username, game preferences, following count and bio
* Display feed of games which the user follows
* Option to message another user

**Optional Nice-to-have Stories**

* User can upload their own profile picture
* User can send friend requests to other users
* Allow creation of a display name along with username
* Profile Settings Tab (update Avatar, Username, Password, Game Genre Preferences and Bio)

### 2. Screen Archetypes

* Login/Registration:
    * User can register a new account
        * Select Avatar image
        * Create Username and Password
        * Create a Bio
        * Set Game Genre Preferences (First-Person Shooters, Fighting, Role-Playing, etc)
    * User can login to their account
* Home Screen:
    * Display a layout of game posters based off the users preferences
    * User can select a poster to see details of the game

* Game Detail:
    * Display game details (Title, Description, etc)
    * User can follow the game which adds it to the users profile
    * User can input their connection purposes after following the game
    * Display all users that follow this game, along with their connection purposes (Looking for Practice, Looking for Co-Op Partner, etc)
    * User can tap one of the other users following the game to view their profile and message them
    
    
* Profile:
    * Display avatar, username, game preferences, follow count and bio
    * Display feed of games which the user follows
    * Option to message another user
* Direct Messaging
    *  User can scroll through a list of users they've messaged
    *  User can open up a previous message thread to continue messaging
* Profile Settings
    * User can update the same profile information from account creation (Avatar, Username, Password, Game Genre Preferences, Bio)

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home
* User Profile
* Messaging
* Profile Settings (Bonus)

**Flow Navigation** (Screen to Screen)

* Sign Up => Home
* Sign In => Home
* Home => Game Details => User Profile => Messaging Thread
* Current User Profile => Game Details => ...
* Messaging Inbox => Messaging Thread => User Profile => ...

## Wireframes
![](https://i.imgur.com/xmo2VYA.jpg)


### [BONUS] Digital Wireframes & Mockups
![](https://i.imgur.com/yxr8c8J.png)

### [BONUS] Interactive Prototype
<img src='https://github.com/CodePath-Union-App/Union/blob/main/wireframe_demo.gif' title='Video Walkthrough' width='400' alt='Video Walkthrough' />

## Schema 

### Models

#### `Users`
| Property        | Data Type | Description
| --------------- | --------- | ----------------------------------------------- |
| objectId        | Integer   | unique id for each user (default field)         |
| username        | String    | user's username                                 |
| password        | String    | user's password                                 |
| avatar          | File      | user's profile image                            |
| bio             | String    | user's profile bio                              |
| gamePreferences | Array     | array listing the game genre's the user prefers |
| createdAt       | DateTime  | date when user is created (default field)       |
| updatedAt       | DateTime  | date when user is last updated (default field)  |

#### `Messages`
| Property  | Data Type       | Description                                       |
| --------- | --------------- | ------------------------------------------------- |
| id        | Integer         | unique id for each message (default field)        |
| author    | Pointer to User | message author                                    |
| recipient | Pointer to User | message recipient                                 |
| body      | String          | contents of the message                           |
| createdAt | DateTime        | date when message is created (default field)      |
| updatedAt | DateTime        | date when message is last updated (default field) |


### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]

### [OPTIONAL: List endpoints if using existing API such as Yelp]
#### Video Game Database API

* Base URL - https://api.igdb.com/v4

| HTTP Verb   | Endpoint        | Description                                       |
| ----------- | --------------- | ------------------------------------------------- |
| `POST`      | /artworks       | official artworks of games                        |
| `POST`      | /covers         | the cover art of games                            |
| `POST`      | /games          | video games                                       |
| `POST`      | /game_videos    | a video associated with a game                    |
| `POST`      | /genres         | genres of video games                             |
| `POST`      | /platforms      | hardware used to run the game or delivery network |
| `POST`      | /release_dates  | to dig deeper into release dates, platforms, etc  |



