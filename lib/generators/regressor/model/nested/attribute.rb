module Regressor
  module Model
    module Nested
      module Attribute
        def nested_attributes
          if @model.constantize.nested_attributes_options.present?
            @model.constantize.nested_attributes_options.keys.map do |key|
              "it { is_expected.to accept_nested_attributes_for :#{key} }"
            end.join("\n\t")
          end
        end
      end
    end
  end
end
