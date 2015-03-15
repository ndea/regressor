module Regressor
  module Model
    module Database
      module Column
        def columns
          @model.constantize.columns.map(&:name).map do |column|
            "it { is_expected.to have_db_column :#{column} }"
          end.join("\n\t")
        end
      end
    end
  end
end