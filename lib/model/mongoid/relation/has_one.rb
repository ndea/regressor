module Regressor
  module Model
    module Mongoid
      module Relation
        module HasOne

          def has_one_relations_as_string
            has_one_relations.join("\n  ")
          end

          def has_one_relations
            @model.reflect_on_all_associations(:has_one).map(&:name).map do |relation|
              ::Regressor::Model::Expression.new(:is_expected,
                                                 :to,
                                                 :have_one, relation).to_s
            end
          end

        end
      end
    end
  end
end