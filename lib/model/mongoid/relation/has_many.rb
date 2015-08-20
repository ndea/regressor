module Regressor
  module Model
    module Mongoid
      module Relation
        module HasMany

          def has_many_relations_as_string
            has_many_relations.join("\n  ")
          end

          def has_many_relations
            @model.reflect_on_all_associations(:has_many).map(&:name).map do |relation|
              ::Regressor::Model::Expression.new(:is_expected,
                                                 :to,
                                                 :have_many, relation).to_s
            end
          end

        end
      end
    end
  end
end