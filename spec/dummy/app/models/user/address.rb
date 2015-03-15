# === Schema ===
# city: string
# zip: string
# street: string
# country: string
# further_information: text
# user_id: integer
class User::Address < ActiveRecord::Base
  # === Relations ===
  belongs_to :user, class_name: User
  # === Validations ===
  validates_presence_of :city, :zip, :street, :country, :further_information, :user
end
