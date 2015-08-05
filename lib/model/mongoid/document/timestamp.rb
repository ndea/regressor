module Regressor
  module Model
    module Mongoid
      module Document
        module Timestamp
          def timestamp_includes
            included_timestamp_modules.map do |module_included|
              "it { is_expected.to #{timestamp_module(module_included)} }"
            end.join("\n  ")
          end

          private

          def included_timestamp_modules
            @model.included.modules.select do |module_included|
              [Mongoid::Timestamps::Created, Mongoid::Timestamps::Updated, Mongoid::Timestamps].include? module_included
            end
          end

          def timestamp_module(module_included)
            case module_included
              when Mongoid::Timestamps
                timestamped_document
              when Mongoid::Timestamps::Created
                timestamped_document_with_created
              when Mongoid::Timestamps::Updated
                timestamped_document_with_updated
            end
          end

          def timestamped_document
            'be_timestamped_document'
          end

          def timestamped_document_with_created
            "#{timestamped_document}.with(:created)"
          end

          def timestamped_document_with_updated
            "#{timestamped_document}.with(:updated)"
          end

        end
      end
    end
  end
end