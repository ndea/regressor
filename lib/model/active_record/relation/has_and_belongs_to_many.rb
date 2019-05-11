module Regressor
  module Model
    module Relation
      module HasAndBelongsToMany
        def has_and_belongs_to_many_relations
          @model.constantize.reflect_on_all_associations(:has_and_belongs_to_many).map(&:name).map do |relation|
            "it { is_expected.to have_and_belong_to_many :#{relation} }"
          end.join("\n  ")
        end
      end
    end
  end
end