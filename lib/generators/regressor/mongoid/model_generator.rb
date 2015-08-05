require 'model/mongoid_model'

module Regressor
  module Mongoid
    class ModelGenerator < Rails::Generators::Base
      source_root(File.expand_path(File.dirname(__FILE__)))

      def create_regression_files
        load_application
        generate_mongoid_specs
      end

      private

      def generate_mongoid_specs
        load_mongoid_models.each do |model|
          save_generate(model) do
            @model = ::Regressor::Model::MongoidModel.new(model)
            create_file "#{Regressor.configuration.regression_path}/#{model.name.tableize.singularize}_spec.rb",
                        ERB.new(File.new(File.expand_path('../../../templates/model/mongoid/model_template.erb', File.dirname(__FILE__))).read).result(binding)
          end
        end
      end

      def load_application
        Rails.application.try(:eager_load!)
      end

      def load_mongoid_models
        models = Object.constants.collect { |sym| Object.const_get(sym) }.
            select { |constant| constant.class == Class && constant.include?(::Mongoid::Document) }
        models << models.map(&:subclasses)
        models.flatten.uniq.reject { |x| Regressor.configuration.excluded_models.include? x }
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
end