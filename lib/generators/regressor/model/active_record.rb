require_relative 'active_record/util'
require_relative 'active_record/relation/belong_to'
require_relative 'active_record/relation/has_one'
require_relative 'active_record/relation/has_many'
require_relative 'active_record/validation/presence'
require_relative 'active_record/validation/length'
require_relative 'active_record/validation/numericality'
require_relative 'active_record/database/column'
require_relative 'active_record/database/index'
require_relative 'active_record/nested/attribute'
require_relative 'active_record/enum'

module Regressor
  module Model
    class ActiveRecord
      # === Includes ===
      include Relation::BelongTo
      include Relation::HasOne
      include Relation::HasMany
      include Validation::Presence
      include Validation::Length
      include Validation::Numericality
      include Database::Column
      include Database::Index
      include Nested::Attribute
      include Enum
      include Util

      # === Attribute Accessors ===
      attr_accessor :model

      # === Methods ===
      def initialize(model)
        @model = model
      end
    end
  end
end