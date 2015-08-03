module Regressor
  module Model
    module Validation
      module Presence
        def presence_validators
          extract_validators(ActiveRecord::Validations::PresenceValidator).map(&:attributes).flatten.map do |attribute|
            "it { is_expected.to validate_presence_of :#{attribute} }"
          end.uniq.join("\n  ")
        end
      end
    end
  end
end