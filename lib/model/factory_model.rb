require_relative 'factory/attributes'

module Regressor
  module Model
    class FactoryModel
      # === Includes ===
      include ::Regressor::Model::Factory::Attributes

      # === Attribute Accessors ===
      attr_accessor :model

      # === Methods ===
      def initialize(model)
        @model = model
      end
    end
  end
end