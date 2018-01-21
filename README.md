# DarkShadow

![darkshadow](https://i0.wp.com/www.gsalam.net/wp-content/uploads/2015/12/Protection-Against-Magic-and-Evil-1-GSalam.Net_.jpg?resize=777%2C437)

Gem built for simple rapid exploit development using ruby. The gem is meant for those who want to learn about security researching and those whom already are security researchers. To help learn and assist in the exploit development process.

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

**Egg Hunting**

```bash
$ darkshadow egghunt -f python -e W00T
```

**VirusTotal Scan**

```bash
$ darkshadow vts -f python -e W00T
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/EasyIP2023/darkshadow.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
