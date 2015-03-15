require_relative 'model/relation/belong_to'
require_relative 'model/relation/has_one'
require_relative 'model/relation/has_many'

require_relative 'model/validation/presence'
require_relative 'model/validation/length'

require_relative 'model/database/column'

class Regressor::RegressionModel

  include Regressor::Model::Relation::BelongTo
  include Regressor::Model::Relation::HasOne
  include Regressor::Model::Relation::HasMany

  include Regressor::Model::Validation::Presence
  include Regressor::Model::Validation::Length

  include Regressor::Model::Database::Column

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

  def nested_attributes
    if @model.constantize.nested_attributes_options.present?
      @model.constantize.nested_attributes_options.keys.map do |key|
        "it { is_expected.to accept_nested_attributes_for :#{key} }"
      end.join("\n\t") rescue nil
    end
  end


  def database_indexes
    ActiveRecord::Base.connection.indexes(@model.tableize.gsub("/", "_")).map do |indexes|
      "it { is_expected.to have_db_index #{indexes.columns}}"
    end.flatten.join("\n\t") rescue nil
  end

end