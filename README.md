# PumpAction

This is a simpler, very hacky substitute for the very useful
[Shotgun](https://github.com/rtomayko/shotgun) gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "pump_action"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pump_action

## Usage

```ruby
task :serve do
  PumpAction.new(
    listen_to: ["path/to/lib"],
    rack_file: "path/to/config.ru",
    port: 3001
  ).run
end
```

## Development

This was a script of convenience and nothing more. Since it has proven valuable
on multiple projects, it makes sense to extract it into a gem.

## Contributing

I might rework this into a more robust, flexible tool for a wider array of
projects at some point in the future. Other priorities make this impractical for
now.

For the time being, bug reports will likely not be addressed. However, pull
requests are welcome on GitHub at https://github.com/jneander/pump_action. This
project is intended to be a safe, welcoming space for collaboration, and
contributors are expected to adhere to the [Contributor
Covenant](http://contributor-covenant.org) code of conduct.

Please be a decent human being.

## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).

**Do not use this in production!**
