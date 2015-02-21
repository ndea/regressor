require 'spec_helper'
require_relative '../../../lib/generators/regressor/install_generator'

describe Regressor::InstallGenerator, type: :generator do
  destination File.expand_path("../../tmp", __FILE__)

  before(:all) do
    prepare_destination
    run_generator
    @file_content = <<EOF
# If the regressor gem is inside a group wrap your initializer in
# if defined?(Regressor) do .. end
Regressor.configure do |config|
  # Defines the path where the generated files will be placed
  # config.regression_path = 'spec/models/regression'

  # Exclude Models for regression spec generation.
  # Provide model names as String (e.g. 'User')
  # config.excluded_models = []
end
EOF
  end

  it "creates a test initializer" do
    assert_file "config/initializers/regressor.rb", @file_content
  end

end