module Regressor
  class InstallGenerator < Rails::Generators::Base
    source_root(File.expand_path(File.dirname(__FILE__)))

    def copy_initializer
      copy_file '../templates/regressor.rb', 'config/initializers/regressor.rb'
    end
  end
end