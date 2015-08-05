module Regressor
  module Model
    module Mongoid
      module Relation
        module BelongsTo
          def belongs_to_relations
            @model.reflect_on_all_associations(:belongs_to).map(&:name).map do |relation|
              "it { is_expected.to belong_to :#{relation} }"
            end.join("\n  ")
          end
        end
      end
    end
  end
end