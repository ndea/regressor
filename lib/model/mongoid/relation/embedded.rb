module Regressor
  module Model
    module Mongoid
      module Relation
        module Embedded

          def embedded_relations_as_string
            embedded_relations.join("\n  ")
          end

          def embedded_relations
            @model.embedded_relations.keys.map do |key|
              macro = @model.embedded_relations[key].macro
              ::Regressor::Model::Expression.new(:is_expected,
                                                 :to,
                                                 embedded_type[macro], key).to_s
            end
          end

          private

          def embedded_type
            {
                embeds_many: :embed_many,
                embeds_one: :embed_one
            }
          end

        end
      end
    end
  end
end