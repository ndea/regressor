require_relative '../../../lib/generators/regressor/controller/routing/rest/routes'

class Regressor::RegressionController
  include Rails.application.routes.url_helpers
  include ActionDispatch::Routing
  include Regressor::Controller::Routing::Rest::Routes

  attr_accessor :controller

  def initialize(controller)
    @controller = controller
  end

end