require 'rails_helper'

RSpec.describe User do

  # === Relations ===
  
  it { is_expected.to have_one :address}
  

  # === Nested Attributes ===
  it { is_expected.to accept_nested_attributes_for :address }

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
	it { is_expected.to have_db_column :first_name }
	it { is_expected.to have_db_column :last_name }
	it { is_expected.to have_db_column :gender }
	it { is_expected.to have_db_column :age }
	it { is_expected.to have_db_column :email }
	it { is_expected.to have_db_column :created_at }
	it { is_expected.to have_db_column :updated_at }

  # === Database (Indexes) ===
  it 'does something' do

  end

  # === Validations (Length) ===
  it { is_expected.to allow_value(Faker::Lorem.characters(0)).for :age }
	it { is_expected.not_to allow_value(Faker::Lorem.characters(-1)).for :age }
	it { is_expected.to allow_value(Faker::Lorem.characters(99)).for :age }
	it { is_expected.not_to allow_value(Faker::Lorem.characters(100)).for :age }

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :first_name }
	it { is_expected.to validate_presence_of :last_name }
	it { is_expected.to validate_presence_of :gender }
	it { is_expected.to validate_presence_of :age }
	it { is_expected.to validate_presence_of :email }

  
  # === Enums ===
  it { is_expected.to define_enum_for(:gender).with(["male", "female"])}
  
end