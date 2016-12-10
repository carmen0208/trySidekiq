## Installation

* Gemfile require sidekiq

```ruby
source "https://rubygems.org"
gem 'sidekiq'
```
* Configuring Client and Server, and writing a Worker

   [example](worker.rb)

## Running the server and giving it work

* Run server

```ruby
bundle exec sidekiq -r ./worker.rb
```

* launch an IRB session, requiring our ruby file:

```ruby
bundle exec irb -r ./worker.rb
```

* play with it

```ruby
OurWorker.perform_async("easy")
OurWorker.perform_async("super_hard")
OurWorker.perform_async("hard")
OurWorker.perform_async("hard")
OurWorker.perform_async("easy")
OurWorker.perform_async("easy")
#....
# Scheduling work
OurWorker.perform_in(5, "easy")

```

### Example 

[sidekiq_playground](/Users/carmen/Work/workspaces/Learn/Ninja Code/Rails/Sidekiq/sidekiq_playground)
