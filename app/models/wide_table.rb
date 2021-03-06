class WideTable < ActiveRecord::Base
  set_table_name 'src_table_data_wide'
  set_primary_key 'src_table_data_wide_id'
  has_many 'comments'
  
  def to_label
    "#{first_name} #{last_name} - #{age.ceil if age != nil} - #{birth_year}"
  end
  
  def full_name
    "#{first_name} #{last_name}".strip
  end
end
