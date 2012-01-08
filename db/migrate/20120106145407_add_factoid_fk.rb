class AddFactoidFk < ActiveRecord::Migration
  def up
    add_column :hyp_items, :collection_id, :integer
  end

  def down
  end
end
