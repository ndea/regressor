require 'model/active_record'

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
            nop
          end
        end
      end

      def load_application
        Rails.application.try(:eager_load!)
      end

      def load_mongoid_models
        models = Object.constants.collect { |sym| Object.const_get(sym) }.
            select { |constant| constant.class == Class && constant.include?(::Mongoid::Document) }

        models.each do |model|
          models << model.subclasses
        end

        models.flatten.uniq.reject { |x| Regressor.configuration.excluded_models.include? x }
      end

      def save_generate(model)
        begin
          yield
        rescue Exception => e
          puts "Cannot create model regression for #{model}"
          puts e.backtrace
        end
      end

    end
  end
end