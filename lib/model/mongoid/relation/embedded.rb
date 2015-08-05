module Regressor
  module Model
    module Mongoid
      module Relation
        module Embedded
          def embedded_relations
            @model.embedded_relations.keys.map do |key|
              macro = @model.embedded_relations[key].macro
              "it { is_expected.to #{embedded_type[macro]} :#{key} }"
            end.join("\n  ")
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