module Regressor
  module Model
    module Factory
      module Attributes
        def columns
          @model.constantize.columns.map(&:name).map do |column|
            "#{column} { Faker::Lorem.sentence }"
          end.join("\n  ")
        end
      end
    end
  end
end