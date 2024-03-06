# Influence Mobile Assessment
Things Used:
* Ruby 3.2.2
* Rails 7.1
* PostgreSQL
* TailwindCSS
* Phlex

## Setup
To get started, clone the repo to your local machine. You'll need access to Postgres somewhere, as well as Redis (Redis is a background dependency for some of the framework features that may or may not be fully utilized in this app).

You'll need to set `DATABASE_URL` to point to your Postgres instance. If you're using direnv, you can allow the .envrc included with this project. Using `DATABASE_URL` as set in .envrc will look for Postgres running on localhost:5432 with your local username and no password.

The default player that's seeded has an email of `test@example.com` and password of `11c178e90ddae2c875314f976f96`.

Since this is throwaway code, I didn't bother excluding the master.key in config.

### Bundle
Install dependencies.
```console
$ bundle install
```

### Setup the database
```console
$ rails db:prepare
```

### Start the server
```console
bin/dev
```

The app should be available at [http://localhost:3000](http://localhost:3000).

## Just the tea
This project is a bit ramshackle. I was focusing on ensuring that this thing worked the way it was supposed to. I wrote _some_ specs, but not many at all. Well, really, I wrote 2 specs. Ideally, I would spend more time writing specs for the rest of the models, the AR types I added, and request specs (or maybe system specs with cucumber). I tried to timebox this to just a few hours. I didn't want to spend days and days working on this. Polish isn't the point of this exercise anyway. Hopefully you won't see any red flags.

I generated the skeleton using the `rails new` and copied in a bunch of what's here from another project I'm working on to bootstrap things.

Tailwind is a devisive choice, but I like it and use it in most of my projects. What I'd really love is a Phlex-based or ViewComponent-based UI library that uses Tailwind for styling. There are a few projects like that but they're too green to really be usable yet.

Phlex was something new I started using a month or so ago just to try it out. It's kind of neat. I like being able to write the view layer in Ruby. It's supposed to be easy to test, but I didn't write specs for it due to time constraints.

You'll notice a distinct lack of React. It's not that I don't like bonus points. It's that it's been a hot minute since I've setup React with Rails and didn't want to sink any extra time into making that work. I have experience using React, though it's been a bit since I've gone deep on it.

I wasn't sure how best to handle selecting offers based on the player's profile. I kinda went the cheap and easy route of storing an age group reference on the offer and then looking up offers based on that reference. Speaking of age groups, get a load of the garbage in `AgeGroup` and `Gender`. I wanted an enum for `Gender` but didn't want to have to maintain those options in both `Player` and `Offer`. My solution was to extract that out into its own class and then use it wherever it was needed. `AgeGroup` needed to be able to define a group of ages and I figured a `Range` would work for that. I've done something similar before in the past where we needed a way to represent static data as first-class objects. I don't quite remember how that was implemented. The keen-eyed among you will notice that when you request all genders or all age groups that it will create new instances each time. If you were actually going to use something like that, you'd want to cache the instances and return them from the cache. That way you're not needlessly filling up objectspace.

Don't look too hard at the `AgeGroupType` implementation. That's just something, cheap, quick, and dirty to get the job done. I'm not necessarily proud of it, but it works.

I'm not entirely sure this was a good showcase of my skills. At least from my perspective anyway. The imposter syndrome hits hard when you're under the gun like this.
