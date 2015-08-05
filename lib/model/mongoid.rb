module Regressor
  module Model
    class Mongoid
      # === Includes ===

      # === Attribute Accessors ===
      attr_accessor :model

      # === Methods ===
      def initialize(model)
        @model = model
      end
    end
  end
end