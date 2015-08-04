require 'generators/regressor/generator/install_generator'
require 'generators/regressor/generator/controller_generator'
require 'generators/regressor/generator/active_record/model_generator'
module Regressor
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
  end

  class Configuration
    attr_accessor :regression_path,
                  :regression_controller_path,
                  :excluded_models,
                  :excluded_controllers,
                  :include_enums

    def initialize
      @regression_path = 'spec/models/regression'
      @regression_controller_path = 'spec/controllers/regression'
      @excluded_models = []
      @excluded_controllers = []
      @include_enums = true
    end
  end
end
