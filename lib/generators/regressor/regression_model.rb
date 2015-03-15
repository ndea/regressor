require_relative 'model/relation/belong_to'
require_relative 'model/relation/has_one'
require_relative 'model/relation/has_many'

require_relative 'model/validation/presence'

class Regressor::RegressionModel

  include Regressor::Model::Relation::BelongTo
  include Regressor::Model::Relation::HasOne
  include Regressor::Model::Relation::HasMany

  include Regressor::Model::Validation::Presence

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

  def validators
    validator_specs = []
    @model.constantize.validators.each do |validator|
      if validator.class.to_s == ActiveRecord::Validations::PresenceValidator.to_s
        validator.attributes.each do |attribute|
          validator_specs << "it { is_expected.to validate_presence_of :#{attribute} }"
        end
      end
      if validator.class.to_s == ActiveModel::Validations::LengthValidator.to_s
        validator.attributes.each do |attribute|
          minimum = validator.options[:minimum]
          maximum = validator.options[:maximum]
          validator_specs << "it { is_expected.to allow_value(Faker::Lorem.characters(#{minimum})).for :#{attribute} }" if minimum
          validator_specs << "it { is_expected.not_to allow_value(Faker::Lorem.characters(#{minimum - 1})).for :#{attribute} }" if minimum
          validator_specs << "it { is_expected.to allow_value(Faker::Lorem.characters(#{maximum})).for :#{attribute} }" if maximum
          validator_specs << "it { is_expected.not_to allow_value(Faker::Lorem.characters(#{maximum + 1})).for :#{attribute} }" if maximum
        end
      end
    end rescue []
    validator_specs.compact.uniq.join("\n\t")
  end

  def nested_attributes
    if @model.constantize.nested_attributes_options.present?
      @model.constantize.nested_attributes_options.keys.map do |key|
        "it { is_expected.to accept_nested_attributes_for :#{key} }"
      end.join("\n\t") rescue nil
    end
  end

  def database_columns
    @model.constantize.columns.map(&:name).map do |column|
      "it { is_expected.to have_db_column :#{column} }"
    end.join("\n\t") rescue nil
  end

  def database_indexes
    ActiveRecord::Base.connection.indexes(@model.tableize.gsub("/", "_")).map do |indexes|
      "it { is_expected.to have_db_index #{indexes.columns}}"
    end.flatten.join("\n\t") rescue nil
  end

end