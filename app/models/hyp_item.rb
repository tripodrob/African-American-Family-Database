class HypItem < ActiveRecord::Base
  belongs_to :collection
  belongs_to :wide_table
end
