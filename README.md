# Rails CRM Tool
This is a super simple CRM built using Ruby on Rails.

<img src="app/assets/images/railsforce.gif">

## Usage
Simply pull this repo into your local machine with the following:
```
$ git pull https://github.com/DylanLovesCoffee/railsforce.git
$ cd railsforce
```

Install your gems and walk through the process of creating and migrating our database.
```
$ bundle install
$ rake db:create
$ rake db:migrate
```

If you want to seed the database with what I have set up in `/app/db/seeds.rb`, run the following:
```
$ rake db:seed
```

Go ahead and start up the Rails server, which typically runs on port 3000:
```
$ rails s
```

[Have fun!](http://localhost:3000/)
