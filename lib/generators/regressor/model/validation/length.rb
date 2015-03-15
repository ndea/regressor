module Regressor
  module Model
    module Validation
      module Length
        def length_validators
          @model.constantize.validators.select do |validator|
            validator.class.to_s == ActiveModel::Validations::LengthValidator.to_s
          end.inject([]) do |result, validator|
            if validator.options[:minimum]
              validator.attributes.each do |attribute|
                result << "it { is_expected.to allow_value(Faker::Lorem.characters(#{validator.options[:minimum]})).for :#{attribute} }"
                result << "it { is_expected.not_to allow_value(Faker::Lorem.characters(#{validator.options[:minimum] - 1})).for :#{attribute} }"
              end
            end
            if validator.options[:maximum]
              validator.attributes.each do |attribute|
                result << "it { is_expected.to allow_value(Faker::Lorem.characters(#{validator.options[:maximum]})).for :#{attribute} }"
                result << "it { is_expected.not_to allow_value(Faker::Lorem.characters(#{validator.options[:maximum] + 1})).for :#{attribute} }"
              end
            end
            result
          end.flatten.compact.uniq.join("\n\t")
        end
      end
    end
  end
end