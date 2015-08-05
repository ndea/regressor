module Regressor
  module Model
    module Mongoid
      module Document
        module Version
          def version_include
            if versioning_included?
              "it { is_expected.to be_versioned_document }"
            else
              "it { is_expected.not_to be_versioned_document }"
            end
          end

          private

          def versioning_included?
            @model.included_modules.map(&:to_s).include? 'Mongoid::Versioning'
          end

        end
      end
    end
  end
end