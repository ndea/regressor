require_relative 'model/relation/belong_to'
require_relative 'model/relation/has_one'
require_relative 'model/relation/has_many'

require_relative 'model/validation/presence'
require_relative 'model/validation/length'

require_relative 'model/database/column'
require_relative 'model/database/index'

require_relative 'model/nested/attribute'

class Regressor::RegressionModel

  include Regressor::Model::Relation::BelongTo
  include Regressor::Model::Relation::HasOne
  include Regressor::Model::Relation::HasMany

  include Regressor::Model::Validation::Presence
  include Regressor::Model::Validation::Length

  include Regressor::Model::Database::Column
  include Regressor::Model::Database::Index

  include Regressor::Model::Nested::Attribute

  attr_accessor :model

  def initialize(model)
    @model = model
  end

  def enums
    enum_specs = []
    @model.constantize.defined_enums.each do |enum_k, enum_v|
      enum_values = enum_v.map do |key, value|
        key
      end
      enum_specs << "it { is_expected.to define_enum_for(:#{enum_k}).with(#{enum_values})}"
    end
    enum_specs.compact.uniq.join("\n\t")
  end


end