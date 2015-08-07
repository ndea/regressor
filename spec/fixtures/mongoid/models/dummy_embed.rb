class DummyEmbed
  include Mongoid::Document
  embedded_in :dummy
end