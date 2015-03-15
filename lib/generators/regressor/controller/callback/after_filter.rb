module Regressor
  module Controller
    module Callback
      module AfterFilter
        def after_callbacks
          after_filters.map do |filter_name|
            "it { should use_after_filter(:#{filter_name}) }"
          end.compact.uniq.join("\n\t")
        end
      end
    end
  end
end
