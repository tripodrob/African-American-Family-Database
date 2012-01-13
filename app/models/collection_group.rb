class CollectionGroup < ActiveRecord::Base
  belongs_to :user
  has_many :collections, :foreign_key => 'group_id'
end
