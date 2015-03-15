module Regressor
  module Model
    module Database
      module Index
        def indexes
          ActiveRecord::Base.connection.indexes(@model.tableize.gsub("/", "_")).map do |indexes|
            "it { is_expected.to have_db_index #{indexes.columns}}"
          end.flatten.join("\n\t")
        end
      end
    end
  end
end