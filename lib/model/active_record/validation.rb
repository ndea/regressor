module Regressor
  module Model
    module Validation
      def wrap_conditional_validations validator, specs
        if_mock = if_condition_mock validator
        unless_mock = unless_condition_mock validator
        padding = if_mock.blank? && unless_mock.blank? ? '' : '    '
        specs = specs.map do |spec|
          "#{padding}#{spec}"
        end.uniq.join("\n  ")
        if if_mock.blank? && unless_mock.blank?
          specs
        else
          "context \"with conditions\" do\n    before do\n#{if_mock}#{unless_mock}    end\n\n#{specs}\n  end\n"
        end
      end

      def if_condition_mock validator
        if_condition = validator.options[:if]
        return '' unless if_condition && if_condition.is_a?(Symbol)
        "      allow(subject).to receive(:#{if_condition.to_s}).and_return(true)\n"
      end

      def unless_condition_mock validator
        unless_condition = validator.options[:unless]
        return '' unless unless_condition && unless_condition.is_a?(Symbol)
        "      allow(subject).to receive(:#{unless_condition.to_s}).and_return(false)\n"
      end
    end
  end
end