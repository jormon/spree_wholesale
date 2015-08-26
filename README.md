SpreeWholesale
==============

Kuli Kuli's wholesale plugin for Spree. Works in coordination with https://github.com/jormon/spree-subscribe.  Inspired by https://github.com/citrus/spree_wholesale

Installation
------------

Add spree_wholesale to your Gemfile:

```ruby
gem 'spree_wholesale'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_wholesale:install
```

Testing
-------

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_wholesale/factories'
```

Copyright (c) 2015 Jordan Moncharmont, released under the New BSD License
