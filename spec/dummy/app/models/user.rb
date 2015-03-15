# === Schema ===
# first_name: string
# last_name: string
# gender: integer
# age: integer
# email: integer

class User < ActiveRecord::Base
  # === Relations ===
  has_one :address, class_name: User::Address
  # === Nested Attributes ===
  accepts_nested_attributes_for :address
  # === Validations (Presence) ===
  validates_presence_of :first_name, :last_name, :gender, :age, :email
  # === Validations (Length)
  validates_length_of :age, minimum: 0, maximum: 99
  # === Enums ===
  enum gender: [:male, :female]
end
