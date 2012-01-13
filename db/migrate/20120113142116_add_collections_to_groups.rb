class AddCollectionsToGroups < ActiveRecord::Migration
  def change
    add_column :collections, :group_id, :integer
  end
end
