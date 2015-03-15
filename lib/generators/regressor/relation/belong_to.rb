class Regressor::Relation::BelongTo

  def belong_to_relations
    @model.constantize.reflect_on_all_associations(:belongs_to).map(&:name).map do |relation|
      "it { is_expected.to belong_to :#{relation}}"
    end.join("\n\t") rescue nil
  end

end