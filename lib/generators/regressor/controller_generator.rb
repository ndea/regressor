require 'controller/regression'

module Regressor
  class ControllerGenerator < Rails::Generators::Base
    source_root(File.expand_path(File.dirname(__FILE__)))

    def create_regression_files
      Rails.application.eager_load!
      ApplicationController.descendants.map(&:name).reject { |x| Regressor.configuration.excluded_controllers.include? x }.each do |controller|
        @controller = Regressor::Controller::Regression.new(controller)
        create_file "#{Regressor.configuration.regression_controller_path}/#{controller.underscore}_spec.rb", ERB.new(File.new(File.expand_path('../../templates/controller/controller_spec_template.erb', File.dirname(__FILE__))).read).result(binding)
      end
    end

  end
end