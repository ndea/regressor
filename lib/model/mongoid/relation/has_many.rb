module Regressor
  module Model
    module Mongoid
      module Relation
        module HasMany
          def has_many_relations
            @model.reflect_on_all_associations(:has_many).map(&:name).map do |relation|
              "it { is_expected.to have_many :#{relation} }"
            end.join("\n  ")
          end
        end
      end
    end
  end
end