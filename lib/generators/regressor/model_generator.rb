require 'model/active_record'

module Regressor
  class ModelGenerator < Rails::Generators::Base
    source_root(File.expand_path(File.dirname(__FILE__)))

    def create_regression_files
      load_application
      generate_ar_specs
    end

    private

    def generate_ar_specs
      load_ar_models.each do |model|
        save_generate(model) do
          @model = ::Regressor::Model::ActiveRecord.new(model)
          create_file "#{Regressor.configuration.regression_path}/#{model.tableize.gsub("/", "_").singularize}_spec.rb",
                      ERB.new(File.new(File.expand_path('../../templates/model/active_record/model_template.erb', File.dirname(__FILE__))).read).result(binding)
        end
      end
    end

    def load_application
      Rails.application.try(:eager_load!)
    end

    def load_ar_models
      if defined?(::ActiveRecord::Base)
        ActiveRecord::Base.descendants.map(&:name).reject { |x| Regressor.configuration.excluded_models.include? x }
      else
        []
      end
    end

    def save_generate(model)
      begin
        yield
      rescue Exception => e
        puts "Cannot create model regression for #{model}"
      end
    end

  end
end