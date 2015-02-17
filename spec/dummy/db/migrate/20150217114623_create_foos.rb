class CreateFoos < ActiveRecord::Migration
  def change
    create_table :foos do |t|
      t.string :foo
      t.string :bar

      t.timestamps
    end
  end
end
