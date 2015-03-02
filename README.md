[![Gem Version](https://badge.fury.io/rb/regressor.svg)](http://badge.fury.io/rb/regressor)
# Regressor
Generate regression specs based on your ActiveRecord models.

# Install
###### Directly from GitHub
```ruby
gem 'regressor', git: 'https://github.com/ndea/regressor.git', branch: 'master'
```
or 
###### Rubygems
```ruby
gem 'regressor', '~> 0.1.5'
```

###### Install regressor
```bash
bundle install
```

```ruby
rails g regressor:install
```

Then require the gem dependency 'shoulda-matchers' in your rails_helper (or spec_helper if you're using RSpec 2.x):
```ruby
require 'shoulda/matchers'
```


# Usage
###### Run the generator:
```ruby
rails generate spec_regression
```

# Configuration
###### Configuration via an initializer:
```ruby
# config/initializers/regressor.rb
Regressor.configure do |config|
  config.regression_path = 'spec/models/regression'
  config.excluded_models = ["Foo", "Bar"]
end
```
###### Default configuration values:
```ruby
regression_path = 'spec/models/regression'
excluded_models = []
```

# Contributing

1. Fork it ( https://github.com/ndea/regressor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
