# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app --- The app is centered around Sinatra, it does all the work for me to send the website to my localhost port
- [x] Use ActiveRecord for storing information in a database --- I use active record migrations, and my classes inherit from ActiveRecord
- [x] Include more than one model class (e.g. User, Post, Category) --- I have the models: User and Hang
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) --- User has_many Hangs
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) --- Post belongs_to User
- [x] Include user accounts with unique login attribute (username or email) --- users must declare a username when making an account, which is checked for uniqueness.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying --- My controller uses get, post, patch and delete to interact with instances of the Hang model
- [x] Ensure that users can't modify content created by other users --- a users id is checked when viewing the patching or deleting page
- [x] Include user input validations --- the user must enter a username and password or they will be sent to the failure page
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code --- see README.md

Confirm
- [x] You have a large number of small Git commits --- see github page
- [x] Your commit messages are meaningful --- they are short, but describe what the commit contains
- [x] You made the changes in a commit that relate to the commit message --- they are short, but describe what the commit contains
- [x] You don't include changes in a commit that aren't related to the commit message --- commit messages describe only the changes in that commit