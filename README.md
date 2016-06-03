## Twitter SAC

### Description
Search by mentions on Twitter API to answer it. Also list users that more quote.

First of all, it will send a automatic request to get mentions and record this response into Tweet's table, allowing App's users to answers the tweet later.
Then, in homepage, the tweets mentioning @locaweb will be showed. Also it's possible do it manually later, by clicking on menu link 'Novas Menções'

To know the Top Mentionners of @locaweb, just click into 'Top Mencionadores', and the tweets will be showed in order to have tweets of the more mentionners in top


### Instalation

It runs over ruby 2.3.0 and rails 4.2.6, so if doesn't have this gem/version intalled, run
```shell
  gem install ruby -v '2.3.0'
  bundle install

  gem install rails -v '4.2.6'
```

Run tests
```ruby
  bundle exec rspec
```

Create db to record tweets that need be answered
```ruby
  bundle exec rake db:migrate
```

Start the APP
```ruby
  rails s
```
And access it into browser: ```localhost:3000```

