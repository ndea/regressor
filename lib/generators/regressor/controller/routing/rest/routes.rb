module Regressor
  module Controller
    module Routing
      module Rest
        module Routes
          def rest_routes
            controller_path = @controller.constantize.controller_path
            url_for(controller: controller_path, action: 'new', only_path: true)
            @controller.constantize.action_methods.map do |method|
              case method
                when 'index'
                  "it { should route(:get, '#{url_for(controller: controller_path, action: method, only_path: true)}').to(action: :index) }"
                when 'show'
                  "it { should route(:get, '#{url_for(controller: controller_path, action: method, id: 1, only_path: true)}').to(action: :show, id: 1) }"
                when 'update'
                  "it { should route(:patch, '#{url_for(controller: controller_path, action: method, id: 1, only_path: true)}').to(action: :update, id: 1) }"
                  "it { should route(:put, '#{url_for(controller: controller_path, action: method, id: 1, only_path: true)}').to(action: :update, id: 1) }"
                when 'destroy'
                  "it { should route(:delete, '#{url_for(controller: controller_path, action: method, id: 1, only_path: true)}').to(action: :destroy, id: 1) }"
                when 'create'
                  "it { should route(:post, '#{url_for(controller: controller_path, action: method, only_path: true)}').to(action: :create) }"
                when 'edit'
                  "it { should route(:get, '#{url_for(controller: controller_path, action: method, id: 1, only_path: true)}').to(action: :edit, id: 1) }"
                when 'new'
                  "it { should route(:get, '#{url_for(controller: controller_path, action: method, only_path: true)}').to(action: :new) }"
              end
            end.uniq.compact.join("\n\t")
          end
        end
      end
    end
  end
end