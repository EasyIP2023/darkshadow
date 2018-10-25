# DarkShadow

![darkshadow](https://i0.wp.com/www.gsalam.net/wp-content/uploads/2015/12/Protection-Against-Magic-and-Evil-1-GSalam.Net_.jpg?resize=777%2C437)

I'm still new to making ruby gems. So please bare with me! :)

Gem built for simple rapid exploit development using ruby. The gem is meant for those who want to learn about security researching and those whom already are security researchers. To help learn and assist in the exploit development process. It includes tools that I've worked on along with tools from the metasploit framework and other locations on the internet.

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

**Patern Offset**

```bash
$ darkshadow poset -q Aa3A
```

**Egg Hunting**

```bash
$ darkshadow egghunt -f python -e W00T
```

**Bash Executions**

```bash
# Disable the Address Space Layout Randomization (ASLR)
$ darkshadow exec -l d
```

**Send Remote Buffers**

```bash
$ darkshadow send --ip 10.0.0.1 -p 8080 -b AAAA --bs 1024
```

**Packet Sniffer**

Becuase you are using raw sockets you need to run the command with sudo permissions.

```bash
$ sudo darkshadow psniff
```

```bash
$ rvmsudo darkshadow psniff
```

Be sure to do one of the following before executing
```
Warning: can not check `/etc/sudoers` for `secure_path`, falling back to call via `/usr/bin/env`, this breaks rules from `/etc/sudoers`. Run:

    export rvmsudo_secure_path=1

to avoid the warning, put it in shell initialization file to make it persistent.

In case there is no `secure_path` in `/etc/sudoers`. Run:

    export rvmsudo_secure_path=0

to avoid the warning, put it in shell initialization file to make it persistent.
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/EasyIP2023/darkshadow.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
