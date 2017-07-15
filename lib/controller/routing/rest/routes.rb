module Regressor
  module Controller
    module Routing
      module Rest
        module Routes
          def rest_routes

            controller_path = @controller.constantize.controller_path
            @controller.constantize.action_methods.map do |action_method|
              begin
                journey_route = extract_journey_route(controller_path, action_method)
                unless journey_route
                  puts "Skip generating regression spec for controller #{controller_path} with action: #{action_method}" unless ENV['QUIET']
                  next
                end
                required_parts = extract_required_parts(journey_route)
                url = url_for({controller: controller_path, action: action_method, only_path: true}.merge(required_parts))
                generate_example(journey_route, controller_path, action_method, required_parts, url)
              rescue
                puts "Failed to generate regression spec for controller #{controller_path} with action: #{action_method}. #{$!.class}: #{$!.message}"
                nil
              end
            end.uniq.compact.join("\n  ")
          end

          private
          
          if Rails::VERSION::MAJOR >= 5
            def generate_example(journey_route, controller_path, action_method, required_parts, url)
              case journey_route.verb
              when 'GET'
                "it { should route(:get, '#{url}').to('#{controller_path}##{action_method}', #{required_parts}) }"
              when 'POST'
                "it { should route(:post, '#{url}').to('#{controller_path}##{action_method}', #{required_parts}) } "
              when 'PUT'
                "it { should route(:put, '#{url}').to('#{controller_path}##{action_method}', #{required_parts}) } "
              when 'PATCH'
                "it { should route(:patch, '#{url}').to('#{controller_path}##{action_method}', #{required_parts}) } "
              when 'DELETE'
                "it { should route(:delete, '#{url}').to('#{controller_path}##{action_method}', #{required_parts}) } "
              end
            end
            
          else
            
            def generate_example(journey_route, controller_path, action_method, required_parts, url)
              request_method = journey_route.constraints[:request_method]
              if request_method.match('GET')
                "it { should route(:get, '#{url}').to('#{controller_path}##{action_method}', #{required_parts}) }"
              elsif request_method.match('POST')
                "it { should route(:post, '#{url}').to('#{controller_path}##{action_method}', #{required_parts}) } "
              elsif request_method.match('PUT')
                "it { should route(:put, '#{url}').to('#{controller_path}##{action_method}', #{required_parts}) } "
              elsif request_method.match('PATCH')
                "it { should route(:patch, '#{url}').to('#{controller_path}##{action_method}', #{required_parts}) } "
              elsif request_method.match('DELETE')
                "it { should route(:delete, '#{url}').to('#{controller_path}##{action_method}', #{required_parts}) } "
              end
            end
          end

          def extract_required_parts(journey_route)
            required_parts_hash = journey_route.required_parts.inject({}) do |required_part_hash, required_part|
              required_part_hash.reverse_merge!({
                                                    required_part => '1'
                                                })
            end

            if journey_route.defaults[:format]
              required_parts_hash.reverse_merge!({
                                                     format: journey_route.defaults[:format]
                                                 })
            end
            required_parts_hash
          end

          def extract_journey_route(controller_path, action_method)
            Rails.application.routes.routes.routes.select do |route|
              if route.defaults.present?
                route.defaults[:controller].to_sym == controller_path.to_sym && route.defaults[:action].to_sym == action_method.to_sym
              else
                false
              end
            end.first
          end

        end
      end
    end
  end
end