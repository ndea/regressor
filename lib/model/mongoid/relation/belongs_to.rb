module Regressor
  module Model
    module Mongoid
      module Relation
        module BelongsTo

          def belongs_to_relations_as_string
            belongs_to_relations.join("\n  ")
          end

          def belongs_to_relations
            @model.reflect_on_all_associations(:belongs_to).map(&:name).map do |relation|
              ::Regressor::Model::Expression.new(:is_expected,
                                                 :to,
                                                 :belong_to, relation).to_s
            end
          end

        end
      end
    end
  end
end