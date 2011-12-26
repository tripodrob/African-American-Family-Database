class CreateHypItems < ActiveRecord::Migration
  def change
    create_table :hyp_items do |t|
      t.integer :wide_table_id
      t.string :hyp_field
      t.string :hyp_value

      t.timestamps
    end
  end
end
