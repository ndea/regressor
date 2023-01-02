module Regressor
  module Model
    module Validation
      module Length
        def length_validators
          extract_validators(::ActiveModel::Validations::LengthValidator).flatten.map do |validator|
            specs = []
            specs.concat generate_length_examples(validator, validator.options[:minimum]-1, validator.options[:minimum]) if validator.options[:minimum]
            specs.concat generate_length_examples(validator, validator.options[:maximum] + 1, validator.options[:maximum]) if validator.options[:maximum]
            wrap_conditional_validations validator, specs.flatten.compact.uniq
          end.join("\n  ")
        end

        private

        def generate_length_examples(validator, upper_bound, lower_bound)
          validator.attributes.map do |attribute|
            [
                "it { is_expected.to allow_value(Faker::Lorem.characters(number: #{lower_bound})).for :#{attribute} }",
                "it { is_expected.not_to allow_value(Faker::Lorem.characters(number: #{upper_bound})).for :#{attribute} }"
            ]
          end
        end
      end
    end
  end
end
