module Regressor
  module Controller
    module Callback
      module BeforeFilter
        def before_callbacks
          before_filters.map do |filter_name|
            "it { should use_before_filter(:#{filter_name}) }"
          end.compact.uniq.join("\n  ")
        end
      end
    end
  end
end