module Regressor
  module Model
    module Relation
      module HasMany
        def has_many_relations
          @model.constantize.reflect_on_all_associations(:has_many).map(&:name).map do |relation|
            "it { is_expected.to have_many :#{relation}}"
          end.join("\n\t") rescue nil
        end
      end
    end
  end
end