[![Gem Version](https://badge.fury.io/rb/regressor.svg)](http://badge.fury.io/rb/regressor)
[![Code Climate](https://codeclimate.com/repos/5506977e6956803f8f003bea/badges/946b605251d8ad324625/gpa.svg)](https://codeclimate.com/repos/5506977e6956803f8f003bea/feed)
# Regressor
Regressor is a regression based testing tool.
What is regression testing? [see here](http://en.wikipedia.org/wiki/Regression_testing).
You can generate specs based on your ActiveRecord models.
# Get Regressor
###### Directly from GitHub
```ruby
gem 'regressor', git: 'https://github.com/ndea/regressor.git', branch: 'master'
```
or 
###### Rubygems
```ruby
gem 'regressor', '~> 0.4.2'
```

# Install
```bash
bundle install
rails g regressor:install
```
This will create an initializer in config/initializers. This initializers looks like this:
###### Initializer
```ruby
# If the regressor gem is inside a group wrap your initializer in
# if defined?(Regressor) do .. end
Regressor.configure do |config|
  # Defines the path where the generated files for your models will be placed
  # config.regression_path = 'spec/models/regression'

  # Defines the path where the generated files for your controllers will be placed
  # config.regression_controller_path = 'spec/controllers/regression'

  # Exclude Models for regression spec generation.
  # Provide model names as String (e.g. 'User')
  # config.excluded_models = []

  # Exclude Controllers for regression generation.
  # Provide controller names as String (e.g. 'UsersController').
  # config.excluded_controllers = []

  # If you are using enums in Rails 4 enable this option to generate regression specs for enums.
  # If your Rails version is =< Rails 3 set this option to false.
  # Default this option is set to true.
  # config.include_enums = true
end
```

Then require the gem dependency 'shoulda-matchers' in your rails_helper (or spec_helper if you're using RSpec 2.x):
```ruby
require 'shoulda/matchers'
```
# Usage
###### Run the generator:
```ruby
rails generate regressor:model # Create Regression specs for your models
rails generate regressor:controller # Create Regression specs for your controllers
```
##### Supported Regressions
###### Models
 - Relations
   - belongs_to
   - has_many
   - has_one
 - Nested Attributes
 - Validations
   - Length
   - Presence
   - Numericality
 - Database
   - Columns
   - Indexes
 - Enums (Rails 4)

###### Controllers
 - Routing
 - Callbacks
   - Before filter
   - After filter
   - Around filter

# Also see
[Airpair - Generate specs for your Rails application](https://www.airpair.com/rspec/posts/gert) 
[Guard for regressor](https://github.com/patrick-nits/guard-regressor)

# Contributing

1. Fork it ( https://github.com/ndea/regressor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
