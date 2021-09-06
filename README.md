# OpenWeatherMapApi
    Currently supported resources:

    One Call API

    TODO:

    Current Weather Data

    5 Day / 3 Hour Forecast

    Weather Maps 1.0
    
    Air Pollution API

    Geocoding API

    Weather Stations

    Weather Triggers

https://openweathermap.org/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'open_weather_map_api'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install open_weather_map_api

## Usage
    Ruby:
```ruby
    require 'open_weather_map_api'

    client = OpenWeatherMapApi::Client.new(api_key: 'YOUR_API_KEY',lat: '40',lon: '49')

    data = client.connect

    puts data.current.temp #Show current temp

    puts data.current.weather[0].description #Description of weather condition
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/open_weather_map_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/open_weather_map_api/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OpenWeatherMapApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Gfalconia/open_weather_map_api/blob/master/CODE_OF_CONDUCT.md).
