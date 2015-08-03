module Regressor
  module Model
    module Enum
      def enums
        enum_specs = []
        @model.constantize.defined_enums.each do |enum_k, enum_v|
          enum_values = enum_v.map do |key, value|
            key
          end
          enum_specs << "it { is_expected.to define_enum_for(:#{enum_k}).with(#{enum_values}) }"
        end
        enum_specs.compact.uniq.join("\n  ")
      end
    end
  end
end