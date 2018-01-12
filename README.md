# darkshadow

Gem built for simple rapid exploit development using ruby.

Tutorials being used for development
* [FuzzySecurity](http://fuzzysecurity.com)
* [Corelan.be](https://www.corelan.be/)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'darkshadow'
```

And then execute:
```
$ bundle
```

Or install it yourself as:

```
$ gem install darkshadow
```

## Usage

**Display all current supported tools**

```bash
$ darkshadow help
```

**Generate Template for Remote Exploits**

```bash
$ darkshadow gen --remote-exploit <filename>
```

**Generate Template for payloads**

```bash
$ darkshadow gen --payload <filename>
```

**Pattern Creating**

```bash
$ darkshadow pate -l 600
```

**Pattern Offset**

```bash
$ darkshadow poset -q Aa3A
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/EasyIP2023/darkshadow.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
