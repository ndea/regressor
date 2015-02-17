module Regressor
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
  end

  class Configuration
    attr_accessor :regression_path

    def initialize
      @regression_path = 'spec/models/regression'
    end
  end
end
