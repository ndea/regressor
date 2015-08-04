require_relative 'model/active_record/util'
require_relative 'model/active_record/relation/belong_to'
require_relative 'model/active_record/relation/has_one'
require_relative 'model/active_record/relation/has_many'
require_relative 'model/active_record/validation/presence'
require_relative 'model/active_record/validation/length'
require_relative 'model/active_record/validation/numericality'
require_relative 'model/active_record/database/column'
require_relative 'model/active_record/database/index'
require_relative 'model/active_record/nested/attribute'
require_relative 'model/active_record/enum'

class Regressor::RegressionModel
  include Regressor::Model::Relation::BelongTo
  include Regressor::Model::Relation::HasOne
  include Regressor::Model::Relation::HasMany
  include Regressor::Model::Validation::Presence
  include Regressor::Model::Validation::Length
  include Regressor::Model::Validation::Numericality
  include Regressor::Model::Database::Column
  include Regressor::Model::Database::Index
  include Regressor::Model::Nested::Attribute
  include Regressor::Model::Enum
  include Regressor::Model::Util

  attr_accessor :model

  def initialize(model)
    @model = model
  end

end