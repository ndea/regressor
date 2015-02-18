# If regressor is only in the :test group wrap your initializer in
# if defined?(Regressor) do .. end
Regressor.configure do |config|
  # Defines the path where the generated files will be placed
  # config.regression_path = 'spec/models/regression'

  # Exclude Models for regression spec generation.
  # Provide model names as String (e.g. 'User')
  # config.excluded_models = []
end