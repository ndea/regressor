module Regressor
  class FactoryGenerator < Rails::Generators::Base
    source_root(File.expand_path(File.dirname(__FILE__)))

    def create_regression_files
      load_application
      generate_factories
    end

    private

    def generate_factories
      load_ar_models.each do |model|
        save_generate(model) do
          create_file "#{Regressor.configuration.regression_factory_path}/#{model.underscore.singularize}_factory.rb",
                      ERB.new(File.new(File.expand_path('../../templates/factory/factory_template.erb', File.dirname(__FILE__))).read).result(binding)
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
      rescue => e
        puts "Cannot create model regression for #{model}. Reason #{e.message}"
      end
    end

  end
end