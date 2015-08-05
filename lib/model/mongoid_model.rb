require 'model/mongoid/database/field'
require 'model/mongoid/relation/has_many'
require 'model/mongoid/relation/has_one'

module Regressor
  module Model
    class MongoidModel
      # === Includes ===
      include Mongoid::Database::Field
      include Mongoid::Relation::HasMany
      include Mongoid::Relation::HasOne

      # === Attribute Accessors ===
      attr_accessor :model

      # === Methods ===
      def initialize(model)
        @model = model
      end

    end
  end
end