module Regressor
  module Model
    module Validation
      module Length
        def length_validators
          extract_length_validators.inject([]) do |result, validator|
            result << generate_validator_examples(validator, validator.options[:minimum]-1, validator.options[:minimum]) if validator.options[:minimum]
            result << generate_validator_examples(validator, validator.options[:maximum] + 1, validator.options[:maximum]) if validator.options[:maximum]
            result
          end.flatten.compact.uniq.join("\n\t")
        end

        private

        def extract_length_validators
          @model.constantize.validators.select do |validator|
            validator.class.to_s == ActiveModel::Validations::LengthValidator.to_s
          end
        end

        def generate_validator_examples(validator, upper_bound, lower_bound)
          validator.attributes.inject([]) do |result, attribute|
            result << "it { is_expected.to allow_value(Faker::Lorem.characters(#{lower_bound})).for :#{attribute} }"
            result << "it { is_expected.not_to allow_value(Faker::Lorem.characters(#{upper_bound})).for :#{attribute} }"
            result
          end
        end
      end
    end
  end
end