class Dummy
  include ::Mongoid::Document

  # === Fields ===
  field :dummy_array, type: Array
  field :dummy_big_decimal, type: BigDecimal
  field :dummy_binary, type: BSON::Binary
  field :dummy_boolean, type: Mongoid::Boolean
  field :dummy_date, type: Date
  field :dummy_date_time, type: DateTime
  field :dummy_float, type: Float
  field :dummy_hash, type: Hash
  field :dummy_integer, type: Integer
  field :dummy_object_id, type: BSON::ObjectId
  field :dummy_range, type: Range
  field :dummy_regexp, type: Regexp
  field :dummy_set, type: Set
  field :dummy_string, type: String
  field :dummy_symbol, type: Symbol
  field :dummy_time, type: Time

  # === Relations ===
  belongs_to :dummy_option
  has_many :dummy_options

  # === Embeds ===
  embeds_many :dummy_embeds
  embeds_one :dummy_embed
end