module Regressor
  module Model
    class FactoryModel
      # === Attribute Accessors ===
      attr_accessor :model

      # === Methods ===
      def initialize(model)
        @model = model
      end
    end
  end
end