require 'regression_model'
class SpecRegressionGenerator < Rails::Generators::Base

  def create_regression_files
    Rails.application.eager_load!
    ActiveRecord::Base.descendants.map(&:name).reject { |x| Regressor.configuration.excluded_models.include? x }.each do |model|
      @model = RegressionModel.new(model)
      create_file "#{Regressor.configuration.regression_path}/#{model.tableize.gsub("/", "_").singularize}_spec.rb", ERB.new(File.new(File.expand_path('templates/spec_regression_template.rb.erb', File.dirname(__FILE__))).read).result(binding)
    end
  end

end