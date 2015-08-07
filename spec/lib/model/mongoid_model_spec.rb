require 'spec_helper'
require 'model/mongoid_model'
require 'model/expression'
require 'mongoid'
require 'fixtures/mongoid/models/dummy'

RSpec.describe Regressor::Model::MongoidModel do
  subject { Regressor::Model::MongoidModel.new(Dummy) }

  # === Regressor::Model::Mongoid::Database::Field ===
  it { expect(subject.fields_as_string).to be_kind_of String }
  it { expect(subject.fields.size).to eq 17 }
  it { expect(subject.fields.first).to eq 'it { is_expected.to have_field(:_id).of_type(BSON::ObjectId) }' }
  it { expect(subject.fields).to include ::Regressor::Model::Expression.new(:is_expected, :to, :have_field, :dummy_array, 'of_type(Array)').to_s }
  it { expect(subject.fields).to include ::Regressor::Model::Expression.new(:is_expected, :to, :have_field, :dummy_big_decimal, 'of_type(BigDecimal)').to_s }
  it { expect(subject.fields).to include ::Regressor::Model::Expression.new(:is_expected, :to, :have_field, :dummy_binary, 'of_type(BSON::Binary)').to_s }
  it { expect(subject.fields).to include ::Regressor::Model::Expression.new(:is_expected, :to, :have_field, :dummy_boolean, 'of_type(Mongoid::Boolean)').to_s }
  it { expect(subject.fields).to include ::Regressor::Model::Expression.new(:is_expected, :to, :have_field, :dummy_date, 'of_type(Date)').to_s }
  it { expect(subject.fields).to include ::Regressor::Model::Expression.new(:is_expected, :to, :have_field, :dummy_date_time, 'of_type(DateTime)').to_s }
  it { expect(subject.fields).to include ::Regressor::Model::Expression.new(:is_expected, :to, :have_field, :dummy_float, 'of_type(Float)').to_s }
  it { expect(subject.fields).to include ::Regressor::Model::Expression.new(:is_expected, :to, :have_field, :dummy_hash, 'of_type(Hash)').to_s }
  it { expect(subject.fields).to include ::Regressor::Model::Expression.new(:is_expected, :to, :have_field, :dummy_integer, 'of_type(Integer)').to_s }
  it { expect(subject.fields).to include ::Regressor::Model::Expression.new(:is_expected, :to, :have_field, :dummy_object_id, 'of_type(BSON::ObjectId)').to_s }
  it { expect(subject.fields).to include ::Regressor::Model::Expression.new(:is_expected, :to, :have_field, :dummy_range, 'of_type(Range)').to_s }
  it { expect(subject.fields).to include ::Regressor::Model::Expression.new(:is_expected, :to, :have_field, :dummy_regexp, 'of_type(Regexp)').to_s }
  it { expect(subject.fields).to include ::Regressor::Model::Expression.new(:is_expected, :to, :have_field, :dummy_set, 'of_type(Set)').to_s }
  it { expect(subject.fields).to include ::Regressor::Model::Expression.new(:is_expected, :to, :have_field, :dummy_string, 'of_type(String)').to_s }
  it { expect(subject.fields).to include ::Regressor::Model::Expression.new(:is_expected, :to, :have_field, :dummy_symbol, 'of_type(Symbol)').to_s }
  it { expect(subject.fields).to include ::Regressor::Model::Expression.new(:is_expected, :to, :have_field, :dummy_time, 'of_type(Time)').to_s }
end
