# Geo Post

An iOS app that allows users to leave geo-fenced messages with text and an image for others to find. Users create a text/image post, "drop" the post at a particular location, and other users can comment on the original post or make their own, if they are within 50 feet. The app will provide distance and cardinal directions to anyone who wants to find the post if they are >50 feet away.

## Technologies Needed
* UIKit
* networking
* MapKit
* Core Location
* Core Data (local storage of post data)
* backend - Firebase

### Stretch Goals
* geo-fenced local notifications (maybe also push)

## Architecture
* MVC

## Views
* Auth (create account, login)
* Create Post
* Find Post (if >50 ft away)
* User Profile
* Map View
* List view of posts (if within 50 ft)

## Models
### Post (in-memory, Core Data, Codable)
* location: `Location`
* text: `String`
* image: binary data (with external CD storage)
* author: `String`

### Location
* latitude: `Double`
* longitude: `Double`
