class CreateSrcTables < ActiveRecord::Migration
  def change
    create_table :src_tables do |t|

      t.timestamps
    end
  end
end
