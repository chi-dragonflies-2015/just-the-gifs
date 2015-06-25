# just-the-gifs
browse and save collections of gifs. and only gifs.

##Summary
Just-the-gifs is a convenient way of creating a personal collection of gifs for your favorite topics and TV shows, from everyone's favorite fandom blogging stite, Tumblr. Create your account and search for your subject matter, and your screen will fill with gifs from your search! click on as many of the gifs as you're interested in, and they'll save to your personal collection. Then you can navigate to your page to see your history of chosen photos, and provide you a link to use them in other locations.

##User Stories
* As a User, I want to be able to search for tags
* As a User, I want to see paginated display of all the tags that match my search, sorted by popularity (note_count)
* As a User, I want to be able to create an account
* As a User, I want to be able to sign into my account
  * When signed in, I want to be able to add gifs from my search results to my personal collection
  * When signed in, I want to be able to delete my account
  * When signed in, I want to be able to clear all gifs from my account
  * When signed in, I want to be able to remove gifs from my collection
* As a User, I want to be able to browse other people's collections of gifs
  * When I'm signed in, I'd like to be able to save their gifs to my own collection as well
  * When I'm browsing a collection of gifs, I'd like to be able to see
    * The search term that lead to that gif (category)
    * The tumblr link to that post
    * a url link to that element
    * image size

## Databases
* Users
  * id
  * username
  * email
  * password_hash
* Tags
  * search_term
* Photos
  * tumblr link
  * raw image link
  * image width
  * image height
* Collections
  * User
  * Photo
  * (Joins User and Photo)
* PhotoTags
  * Tag
  * Photo
  * (Joins Photo and Tag)

- Associations
  - Users
    - A User has one Collection.
    - A User has many Photos, through Collection
  - Tags
    - A Tag has many PhotoTags
    - A Tag has many Photos, through PhotoTags
  - Photos
    - A Photo belongs to many Collections
    - A Photo belongs to many Users, through Collections
    - A Photo has many PhotoTags
    - A Photo has many Tags, through PhotoTags
  - Collections
    - A Collecton belongs to one User
    - A Collection has many Photos
  - PhotoTags
    - A PhotoTag belongs to a Photo
    - A PhotoTag belongs to a Tag

## Stretch

* Users should be able to add each other as friends to see their collections
