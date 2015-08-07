module Regressor
  module Model
    module Validation
      module Presence
        def presence_validators
          extract_validators(::ActiveRecord::Validations::PresenceValidator).flatten.map do |validator|
            specs = validator.attributes.map do |attribute|
              "it { is_expected.to validate_presence_of :#{attribute} }"
            end.uniq
            wrap_conditional_validations validator, specs
          end.join("\n  ")
        end
      end
    end
  end
end