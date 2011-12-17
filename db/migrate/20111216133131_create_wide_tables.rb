class CreateWideTables < ActiveRecord::Migration
  def change
    create_table :wide_tables do |t|

      t.timestamps
    end
  end
end
