class Collection < ActiveRecord::Base
  belongs_to :collection_group, :foreign_key => 'group_id'
  has_many :hyp_items
end
