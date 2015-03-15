module Regressor
  module Controller
    module Routing
      module Rest
        module Routes
          def rest_routes
            controller_path = @controller.constantize.controller_path
            @controller.constantize.action_methods.map do |action_method|
              journey_route = Rails.application.routes.routes.routes.select do |route|
                if route.defaults.present?
                  route.defaults[:controller].to_sym == controller_path.to_sym && route.defaults[:action].to_sym == action_method.to_sym
                else
                  false
                end
              end.first

              required_parts = journey_route.required_parts.inject({}) do |required_part_hash, required_part|
                required_part_hash.merge!({
                                              required_part => 1
                                          })
              end
              url = url_for({controller: controller_path, action: action_method, only_path: true}.merge(required_parts))

              if journey_route.constraints[:request_method].match('GET')
                "it { should route(:get, '#{url}').to(#{{controller: controller_path, action: action_method}.merge(required_parts).to_s}) } "
              elsif journey_route.constraints[:request_method].match('POST')
                "it { should route(:post, '#{url}').to(#{{controller: controller_path, action: action_method}.merge(required_parts).to_s}) } "
              elsif journey_route.constraints[:request_method].match('PUT')
                "it { should route(:put, '#{url}').to(#{{controller: controller_path, action: action_method}.merge(required_parts).to_s}) } "
              elsif journey_route.constraints[:request_method].match('PATCH')
                "it { should route(:patch, '#{url}').to(#{{controller: controller_path, action: action_method}.merge(required_parts).to_s}) } "
              elsif journey_route.constraints[:request_method].match('DELETE')
                "it { should route(:delete, '#{url}').to(#{{controller: controller_path, action: action_method}.merge(required_parts).to_s}) } "
              end

            end.uniq.compact.join("\n\t")
          end
        end
      end
    end
  end
end