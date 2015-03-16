require_relative 'regression_model'

module Regressor
  class ModelGenerator < Rails::Generators::Base
    source_root(File.expand_path(File.dirname(__FILE__)))

    def create_regression_files
      Rails.application.eager_load!
      ActiveRecord::Base.descendants.map(&:name).reject { |x| Regressor.configuration.excluded_models.include? x }.each do |model|
        begin
          @model = Regressor::RegressionModel.new(model)
          create_file "#{Regressor.configuration.regression_path}/#{model.tableize.gsub("/", "_").singularize}_spec.rb", ERB.new(File.new(File.expand_path('../templates/spec_regression_template.erb', File.dirname(__FILE__))).read).result(binding)
        rescue Exception
          puts "Cannot create Model Regression for: #{model}"
        end
      end
    end

  end
end