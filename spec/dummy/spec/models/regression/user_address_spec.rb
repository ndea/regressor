require 'rails_helper'

RSpec.describe User::Address do

  # === Relations ===
  it { is_expected.to belong_to :user}
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
	it { is_expected.to have_db_column :city }
	it { is_expected.to have_db_column :zip }
	it { is_expected.to have_db_column :street }
	it { is_expected.to have_db_column :country }
	it { is_expected.to have_db_column :further_information }
	it { is_expected.to have_db_column :user_id }
	it { is_expected.to have_db_column :created_at }
	it { is_expected.to have_db_column :updated_at }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["user_id"]}

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :city }
	it { is_expected.to validate_presence_of :zip }
	it { is_expected.to validate_presence_of :street }
	it { is_expected.to validate_presence_of :country }
	it { is_expected.to validate_presence_of :further_information }
	it { is_expected.to validate_presence_of :user }

  
  # === Enums ===
  
  
end