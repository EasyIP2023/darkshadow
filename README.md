# Reaper

This gem was built for simple rapid exploit development using ruby. Still in Beta current supportes tools taken form the metasploit framework tools folder.


## Installation

**Note:** Gem isn't official still in Beta install via locally
```bash
$ git clone https://github.com/EasyIP2023/reaper.git
$ cd reaper/
$ gem build reaper.gemspec
$ gem install --local reaper-0.1.0.gem
```

Add this line to your application's Gemfile:

```ruby
gem 'reaper'
```

And then execute:
```
$ bundle
```

Or install it yourself as:

```
$ gem install reaper
```

## Usage

**Display all current supported tools**

```bash
$ reaper help
```

**Generate Template for Remote Exploits**

```bash
$ reaper gen --remote-exploit <filename>
```

**Generate Template for payloads**

```bash
$ reaper gen --payload <filename>
```

**Pattern Creating**

```bash
$ reaper pate -l 600
```

**Pattern Offset**

```bash
$ reaper poset -q Aa3A
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/EasyIP2023/reaper.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
