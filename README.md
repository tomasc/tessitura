# Tessitura

[![Build Status](https://travis-ci.org/tomasc/tessitura.svg)](https://travis-ci.org/tomasc/tessitura) [![Gem Version](https://badge.fury.io/rb/tessitura.svg)](http://badge.fury.io/rb/tessitura) [![Coverage Status](https://img.shields.io/coveralls/tomasc/tessitura.svg)](https://coveralls.io/r/tomasc/tessitura)

Simple wrapper of [Tessitura](http://www.tessituranetwork.com) API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tessitura'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tessitura_api

## Usage

Consume the performance API:

```ruby
base_uri = 'https://testapp.tessituranetworkramp.com'
tessitura_api_call = Tessitura::ApiCall.new(base_uri: base_uri)
performance_id = 1234
performance = tessitura_api_call.performance(performance_id) # => Tessitura::Performance
```

See the `Performance`, `AllPrice` and `PriceType` classes and tests for list of available methods.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tomasc/tessitura.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
