module Regressor
  module Model
    module Util
      def extract_validators(validator_type)
        @model.constantize.validators.select do |validator|
          validator.class.to_s == validator_type.to_s
        end
      end
    end
  end
end
