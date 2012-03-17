class ChurchMember < ActiveRecord::Base
  set_table_name 'st_20_ChurchMembership_1851_1880'
  set_primary_key 'ROW_NUM'
end

# a.each do |cm|
#   wt = WideTable.new
#   wt.src_table_id = 18
#   wt.topic_type = 'person'
#   wt.age_group = ''
#   wt.first_name = "#{cm.MEMBER_FIRSTNAME}#{' '+cm.MEMBER_MIDDLENAME if cm.MEMBER_MIDDLENAME != nil and cm.MEMBER_MIDDLENAME != ''}"
#   wt.last_name = "#{cm.MEMBER_SURNAME}"
#   wt.gender = cm.MEMBER_GENDER == 'F' ? 'female' : 'male'
#   wt.race = cm.MEMBER_RACE
#   wt.location_person = cm.CHURCH
#   wt.record_year = cm.YEAR != nil ? cm.YEAR : 0
#   wt.record_year = 0 if wt.record_year == nil
#   wt.owner = "#{cm.OWNER_FIRSTNAME}#{' '+cm.OWNER_MIDDLENAME if cm.OWNER_MIDDLENAME != nil and cm.OWNER_MIDDLENAME != ''}#{' '+cm.OWNER_MIDDLENAME2 if cm.OWNER_MIDDLENAME2 != nil and cm.OWNER_MIDDLENAME2 != ''}#{' '+cm.OWNER_SURNAME if cm.OWNER_SURNAME != nil and cm.OWNER_SURNAME != ''}"
#   wt.save
# end
  