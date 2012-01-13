class WideTable < ActiveRecord::Base
  set_table_name 'src_table_data_wide'
  set_primary_key 'src_table_data_wide_id'
  
  def to_label
    "#{first_name} #{last_name} - #{age.ceil} - #{birth_year}"
  end
end
