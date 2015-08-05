module Regressor
  module Model
    module Mongoid
      module Database
        module Field
          def fields
            @model.fields.keys.map do |field|
              "it { is_expected.to have_field(:#{field}).of_type(#{field_type(@model, field)}) }"
            end.join("\n  ")
          end

          private

          def field_type(model, field)
            model.fields[field].type
          end
        end
      end
    end
  end
end