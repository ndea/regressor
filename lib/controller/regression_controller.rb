require_relative '../../../lib/generators/regressor/controller/util'
require_relative '../../../lib/generators/regressor/controller/routing/rest/routes'
require_relative '../../../lib/generators/regressor/controller/callback/before_filter'
require_relative '../../../lib/generators/regressor/controller/callback/after_filter'
require_relative '../../../lib/generators/regressor/controller/callback/around_filter'

class Regressor::RegressionController
  include Rails.application.routes.url_helpers
  include ActionDispatch::Routing

  include Regressor::Controller::Util
  include Regressor::Controller::Routing::Rest::Routes
  include Regressor::Controller::Callback::BeforeFilter
  include Regressor::Controller::Callback::AfterFilter
  include Regressor::Controller::Callback::AroundFilter

  attr_accessor :controller

  def initialize(controller)
    @controller = controller
  end

end