module Regressor
  module Model
    module Validation
      module Length
        def length_validators
          extract_validators(ActiveModel::Validations::LengthValidator).inject([]) do |result, validator|
            result << generate_length_examples(validator, validator.options[:minimum]-1, validator.options[:minimum]) if validator.options[:minimum]
            result << generate_length_examples(validator, validator.options[:maximum] + 1, validator.options[:maximum]) if validator.options[:maximum]
            result
          end.flatten.compact.uniq.join("\n\t")
        end

        private

        def generate_length_examples(validator, upper_bound, lower_bound)
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