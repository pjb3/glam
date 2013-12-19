# Glam

Make your HTML look glamorous! Glam takes well-formed but possibly dubiously formatted HTML and outputs it as pretty printed HTML 5.

## Installation

Add this line to your application's Gemfile:

    gem 'glam'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install glam

## Usage

Glam can be used as a command-line tool. For example, if you have an HTML file like this:

**example.html**

``` html
<html><head><title>Example</title></head><body><h1>Example</h1></body></html>
```

You can glamorize it like this:

    $ glam example.html

Which outputs:

``` html
<!doctype html>
<html>
  <head>
    <title>
      Example
    </title>
  </head>
  <body>
    <h1>
      Example
    </h1>
  </body>
</html>
```

You can also produce the same output by piping HTML into `glam`:

    $ cat example.html | glam

You can also use Glam from ruby code:

``` ruby
require 'glam'

puts Glam(File.read('example.html')) 
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
