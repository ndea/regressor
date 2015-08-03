require_relative 'regression_model'

module Regressor
  class ModelGenerator < Rails::Generators::Base
    source_root(File.expand_path(File.dirname(__FILE__)))

    def create_regression_files
      Rails.application.eager_load!

      models = if Regressor.configuration.orm == :mongoid
                 load_mongoid_models
               else
                 load_ar_models
               end

      models.each do |model|
        begin
          @model = Regressor::RegressionModel.new(model)
          create_file "#{Regressor.configuration.regression_path}/#{model.tableize.gsub("/", "_").singularize}_spec.rb", ERB.new(File.new(File.expand_path('../templates/spec_regression_template.erb', File.dirname(__FILE__))).read).result(binding)
        rescue Exception
          puts "Cannot create Model Regression for: #{model}"
        end
      end
    end

    def load_ar_models
      ActiveRecord::Base.descendants.map(&:name).reject { |x| Regressor.configuration.excluded_models.include? x }
    end

    def load_mongoid_models
      models = Object.constants.collect { |sym| Object.const_get(sym) }.
          select { |constant| constant.class == Class && constant.include?(Mongoid::Document) }
      models.each do |model|
        models << model.subclasses
      end
      models.flatten
    end

  end
end