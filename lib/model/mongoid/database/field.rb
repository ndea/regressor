module Regressor
  module Model
    module Mongoid
      module Database
        module Field

          def fields_as_string
            fields.join("\n  ")
          end

          def fields
            @model.fields.keys.map do |field|
              ::Regressor::Model::Expression.new(:is_expected,
                                                 :to,
                                                 :have_field,
                                                 field,
                                                 "of_type(#{field_type(@model, field)})").to_s
            end
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