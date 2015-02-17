# Regressor
Generate regression specs based on your ActiveRecord models.

# Install
###### Directly from GitHub
```ruby
gem 'regressor', git: 'https://github.com/ndea/regressor.git', branch: 'master'
```

# Usage
###### Run the generator:
```ruby
bundle generate spec_regression
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
