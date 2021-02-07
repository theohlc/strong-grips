# Strong::Grips

Strong grips creates a html site for you to manage your grip strength exercises. Multiple users can make accounts. Each user can add any number of unique grip strength exercises, with a duration to their page. The date of each exercise is auto recorded.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'strong-grips'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install strong-grips

## Usage

Use sinatra to start up the application by entering "shotgun" into the console. Then using your prefered web browser navigate to localhost:9393 From there sign up, log in, and begin recording your training.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/theohlc/strong-grips. Please add comments.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
