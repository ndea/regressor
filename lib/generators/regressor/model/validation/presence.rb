module Regressor
  module Model
    module Validation
      module Presence
        def presence_validators
          @model.constantize.validators.select do |validator|
            validator.class.to_s == ActiveRecord::Validations::PresenceValidator.to_s
          end.map(&:attributes).flatten.map do |attribute|
            "it { is_expected.to validate_presence_of :#{attribute} }"
          end.uniq.join("\n\t")
        end
      end
    end
  end
end
