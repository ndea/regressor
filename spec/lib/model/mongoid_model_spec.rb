require 'spec_helper'
require 'model/mongoid_model'
require 'mongoid'
require 'fixtures/mongoid/models/dummy'

RSpec.describe Regressor::Model::MongoidModel do
  subject { Regressor::Model::MongoidModel.new(Dummy) }

  it { expect(subject.fields_as_string).to be_kind_of String }
  it { expect(subject.fields.first).to eq 'it { is_expected.to have_field(:_id).of_type(BSON::ObjectId) }' }

end