require_relative 'model/util'
require_relative 'model/relation/belong_to'
require_relative 'model/relation/has_one'
require_relative 'model/relation/has_many'
require_relative 'model/validation/presence'
require_relative 'model/validation/length'
require_relative 'model/validation/numericality'
require_relative 'model/database/column'
require_relative 'model/database/index'
require_relative 'model/nested/attribute'
require_relative 'model/enum'

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