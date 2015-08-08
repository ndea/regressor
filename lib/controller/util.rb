module Regressor
  module Controller
    module Util

      def before_filters
        filters(:before)
      end

      def after_filters
        filters(:after)
      end

      def around_filters
        filters(:around)
      end

      private
      def filters(kind = nil)
        controller = @controller.constantize
        all_filters = controller._process_action_callbacks
        all_filters = all_filters.select { |f| f.kind == kind } if kind
        # Reject procs
        all_filters = all_filters.map(&:raw_filter).reject{|filter| filter.class == Proc}
        all_filters.map {|filter| filter.is_a?(Symbol) ? ":#{filter}" : filter.to_s}
      end
    end
  end
end