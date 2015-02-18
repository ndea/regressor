# Regressor
Generate regression specs based on your ActiveRecord models.

# Install
###### Directly from GitHub
```ruby
gem 'regressor', git: 'https://github.com/ndea/regressor.git', branch: 'master'
```
```bash
bundle install
```
###### Install regressor
```ruby
rails g regressor:install
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
