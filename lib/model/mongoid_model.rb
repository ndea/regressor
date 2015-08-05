require 'model/mongoid/database/field'

module Regressor
  module Model
    class MongoidModel
      # === Includes ===
      include Mongoid::Database::Field

      # === Attribute Accessors ===
      attr_accessor :model

      # === Methods ===
      def initialize(model)
        @model = model
      end

    end
  end
end