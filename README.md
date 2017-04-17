# OmniAuth Sproutmark OAuth2 Strategy

A SproutMark OAuth2 strategy for OmniAuth.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-sproutmark'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-sproutmark

## Usage

Register your application with SproutMark: https://www.sproutmark.com/profile/apps

This is an example that you might put into a Rails initializer at `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :sproutmark, ENV['SPROUTMARK_APP_ID'], ENV['SPROUTMARK_SECRET']
end
```

## Granting Permissions to Your Application

With the SproutMark API, you have the ability to specify which permissions you want users to grant your application.

By default, omniauth-sproutmark requests the following permissions:

    'global'

You can configure the scope option:

```ruby
provider :sproutmark, ENV['SPROUTMARK_APP_ID'], ENV['SPROUTMARK_SECRET'], :scope => 'identity'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/omniauth-sproutmark. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

