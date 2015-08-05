module Regressor
  module Model
    module Validation
      module Numericality
        def numericality_validators
          extract_validators(::ActiveModel::Validations::NumericalityValidator).inject([]) do |result, validator|
            if validator.options.blank?
              result += validator_without_options(validator)
            else
              result += validator_with_options(validator)
            end
            result
          end.uniq.join("\n  ")
        end

        private

        def validator_without_options(validator)
          validator.attributes.map do |attribute|
            "it { is_expected.to validate_numericality_of(:#{attribute}) }"
          end.flatten
        end

        def validator_with_options(validator)
          validator.options.map do |k, v|
            assertion = (v ? :to : :not_to)
            case k
              when :even
                generate_spec_with_option(validator, :even, assertion)
              when :only_integer
                generate_spec_with_option(validator, :only_integer, assertion)
              when :allow_nil
                generate_spec_with_option(validator, :allow_nil, assertion)
              when :less_than
                generate_spec_with_option(validator, "is_less_than(#{v})") +
                    generate_spec_with_option(validator, "is_less_than(#{v + 1})", :not_to)
              when :less_than_or_equal_to
                generate_spec_with_option(validator, "is_less_than_or_equal_to(#{v})") +
                    generate_spec_with_option(validator, "is_less_than_or_equal_to(#{v + 1})", :not_to)
              when :equal_to
                generate_spec_with_option(validator, "is_equal_to(#{v})") +
                    generate_spec_with_option(validator, "is_equal_to(#{v + 1})", :not_to)
              when :greater_than_or_equal_to
                generate_spec_with_option(validator, "is_greater_than_or_equal_to(#{v})") +
                    generate_spec_with_option(validator, "is_greater_than_or_equal_to(#{v - 1})", :not_to)
              when :greater_than
                generate_spec_with_option(validator, "is_greater_than(#{v})") +
                    generate_spec_with_option(validator, "is_greater_than(#{v - 1})", :not_to)
              when :odd
                generate_spec_with_option(validator, :odd, assertion)
              when :message
                generate_spec_with_option(validator, "with_message('#{v}')")
            end
          end.flatten
        end

        def generate_spec_with_option(validator, matcher, assertion = :to)
          validator.attributes.map do |attribute|
            "it { is_expected.#{assertion} validate_numericality_of(:#{attribute}).#{matcher} }"
          end
        end

      end
    end
  end
end