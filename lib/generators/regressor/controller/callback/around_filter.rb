module Regressor
  module Controller
    module Callback
      module AroundFilter
        def around_callbacks
          around_filters.map do |filter_name|
            "it { should use_around_filter(:#{filter_name}) }"
          end.compact.uniq.join("\n  ")
        end
      end
    end
  end
end