# Coercible

[![Build Status](https://secure.travis-ci.org/solnic/coercible.png)](http://travis-ci.org/solnic/coercible)
[![Dependency Status](https://gemnasium.com/solnic/coercible.png)](https://gemnasium.com/solnic/coercible)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/solnic/coercible)

## Installation

Add this line to your application's Gemfile:

    gem 'coercible'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coercible

## Usage

``` ruby
# build coercer instance
coercer = Coercible::Coercer.new do |config|
  config.string.boolean_map = { 'yup' => true, 'nope' => false }
end

# coerce a string to boolean
coercer[String].to_boolean('yup') # => true
coercer[String].to_boolean('nope') # => false
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
