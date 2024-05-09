# RestCountries

A Ruby Client for [Rest Countries v.3.1](https://restcountries.com/)

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add rest_countries

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install rest_countries

## Usage

To access the API, you'll need to create a RestCountries::Client.

    $ client = RestCountries::Client.new

The client then gives you access to the endpoints

### All

    $ client.all

### Name

    $ client.name(country_name)

### Full Name

    $ client.fullname(country_name)

### Code

    $ client.code(code)

### List of Codes

    $ client.codes(codes)

### Currency

    $ client.currency(currency)

### Demonym

    $ client.demonym(demonym)

### Language

    $ client.language(language)

### Capital City

    $ client.capital(capital)

### Region

Search by region: Africa, Americas, Asia, Europe, Oceania

    $ client.region(region)

### Subregions

    $ client.subregion(subregion)

### Translation

    $ client.translation(translation)

### Filter Response

    $ client.filter(service, fields)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rest_countries. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/rest_countries/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RestCountries project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rest_countries/blob/master/CODE_OF_CONDUCT.md).
