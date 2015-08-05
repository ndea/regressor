require 'controller/util'
require 'controller/routing/rest/routes'
require 'controller/callback/after_filter'
require 'controller/callback/before_filter'
require 'controller/callback/around_filter'

module Regressor
  module Controller
    class Regression
      include Rails.application.routes.url_helpers
      include ActionDispatch::Routing

      include Util
      include Routing::Rest::Routes
      include Callback::BeforeFilter
      include Callback::AfterFilter
      include Callback::AroundFilter

      attr_accessor :controller

      def initialize(controller)
        @controller = controller
      end
    end
  end
end