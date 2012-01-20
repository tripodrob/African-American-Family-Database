# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120115213006) do

  create_table "collection_groups", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collections", :force => true do |t|
    t.string   "name"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.boolean  "validated"
  end

  create_table "hyp_items", :force => true do |t|
    t.integer  "wide_table_id"
    t.string   "hyp_field"
    t.string   "hyp_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "collection_id"
  end

  create_table "src_table", :primary_key => "src_table_id", :force => true do |t|
    t.string  "src_table_name",                               :null => false
    t.text    "title",          :limit => 255,                :null => false
    t.text    "description",                                  :null => false
    t.integer "year_start",                                   :null => false
    t.integer "year_end",                                     :null => false
    t.text    "doc_type",       :limit => 255,                :null => false
    t.string  "row_id_field",   :limit => 80,                 :null => false
    t.text    "google_doc_key",                               :null => false
    t.integer "in_use",                        :default => 1, :null => false
  end

  add_index "src_table", ["src_table_name"], :name => "src_table_name", :unique => true

  create_table "src_table_colmap", :primary_key => "src_table_colmap_id", :force => true do |t|
    t.integer "src_table_id",                :null => false
    t.string  "name_original",               :null => false
    t.string  "name_actual",                 :null => false
    t.string  "topic_type",    :limit => 40, :null => false
    t.integer "topic_ord",     :limit => 1,  :null => false
    t.string  "topic_prop",    :limit => 40, :null => false
  end

  add_index "src_table_colmap", ["src_table_id", "name_actual"], :name => "src_table_id_and_name_given", :unique => true

  create_table "src_table_colmap_v", :id => false, :force => true do |t|
    t.integer "src_table_colmap_id",                :default => 0,  :null => false
    t.integer "src_table_id",                                       :null => false
    t.string  "name_original",                                      :null => false
    t.string  "name_actual",                                        :null => false
    t.string  "topic_type",          :limit => 40,                  :null => false
    t.integer "topic_ord",           :limit => 1,                   :null => false
    t.string  "topic_prop",          :limit => 40,                  :null => false
    t.text    "topic_gloss",         :limit => 255
    t.integer "distinct_lov",        :limit => 1,   :default => -1
  end

  create_table "src_table_data", :primary_key => "src_table_data_id", :force => true do |t|
    t.integer "src_table_id",                    :null => false
    t.integer "src_table_row_num",               :null => false
    t.string  "topic_type",        :limit => 20, :null => false
    t.integer "topic_ord",         :limit => 1,  :null => false
    t.string  "topic_title",       :limit => 80, :null => false
    t.string  "prop_key",          :limit => 20, :null => false
    t.string  "prop_value",        :limit => 80, :null => false
  end

  add_index "src_table_data", ["prop_value"], :name => "prop_value"
  add_index "src_table_data", ["src_table_id", "src_table_row_num", "topic_type", "topic_ord", "topic_title", "prop_key", "prop_value"], :name => "src_table_id", :unique => true
  add_index "src_table_data", ["topic_title"], :name => "topic_title"

  create_table "src_table_data_OLD", :primary_key => "src_table_data_id", :force => true do |t|
    t.integer "src_table_id",                    :null => false
    t.integer "src_table_row_num",               :null => false
    t.string  "topic_type",        :limit => 20, :null => false
    t.integer "topic_ord",         :limit => 1,  :null => false
    t.string  "topic_title",       :limit => 80, :null => false
    t.string  "prop_key",          :limit => 20, :null => false
    t.string  "prop_value",        :limit => 80, :null => false
  end

  add_index "src_table_data_old", ["src_table_id", "src_table_row_num", "topic_type", "topic_ord", "topic_title", "prop_key", "prop_value"], :name => "src_table_id", :unique => true

  create_table "src_table_data_wide", :primary_key => "src_table_data_wide_id", :force => true do |t|
    t.integer "src_table_id"
    t.integer "src_table_row_num"
    t.string  "topic_type",        :limit => 20
    t.integer "topic_ord",         :limit => 1
    t.string  "topic_title",       :limit => 80
    t.string  "first_name",        :limit => 80
    t.float   "age"
    t.string  "birthplace",        :limit => 80
    t.string  "last_name",         :limit => 80
    t.string  "gender",            :limit => 80
    t.string  "race",              :limit => 80
    t.string  "household",         :limit => 80
    t.string  "family_role",       :limit => 80
    t.string  "marital_status",    :limit => 80
    t.string  "occupation",        :limit => 80
    t.string  "dwelling",          :limit => 80
    t.string  "ability_to_write",  :limit => 80
    t.string  "ability_to_read",   :limit => 80
    t.string  "status",            :limit => 80
    t.string  "minister",          :limit => 80
    t.string  "mother",            :limit => 80
    t.string  "father",            :limit => 80
    t.string  "family",            :limit => 80
    t.string  "record_date",       :limit => 80
    t.integer "record_year",                     :null => false
    t.string  "husband",           :limit => 80
    t.string  "wife",              :limit => 80
    t.string  "record",            :limit => 80
    t.string  "owner",             :limit => 80
    t.string  "school",            :limit => 80
    t.string  "division",          :limit => 80
    t.string  "value",             :limit => 80
    t.string  "birth_month",       :limit => 80
    t.string  "disposition",       :limit => 80
    t.string  "birth_year",        :limit => 80
    t.string  "purchaser",         :limit => 80
    t.string  "legatee",           :limit => 80
    t.string  "deaf",              :limit => 80
    t.string  "value_notes",       :limit => 80
    t.string  "location_person",   :limit => 80
    t.string  "age_group",         :limit => 10, :null => false
  end

  add_index "src_table_data_wide", ["age"], :name => "age"
  add_index "src_table_data_wide", ["birthplace"], :name => "birthplace"
  add_index "src_table_data_wide", ["family_role"], :name => "family_role"
  add_index "src_table_data_wide", ["first_name"], :name => "first_name"
  add_index "src_table_data_wide", ["gender"], :name => "gender"
  add_index "src_table_data_wide", ["last_name"], :name => "last_name"
  add_index "src_table_data_wide", ["race"], :name => "race"
  add_index "src_table_data_wide", ["src_table_id", "src_table_row_num", "topic_type", "topic_ord"], :name => "src_table_id", :unique => true

  create_table "src_table_data_wide_TMP", :primary_key => "src_table_data_wide_id", :force => true do |t|
    t.integer "src_table_id"
    t.integer "src_table_row_num"
    t.string  "topic_type",        :limit => 20
    t.integer "topic_ord",         :limit => 1
    t.string  "topic_title",       :limit => 80
    t.string  "first_name",        :limit => 80
    t.string  "age",               :limit => 80
    t.string  "birthplace",        :limit => 80
    t.string  "last_name",         :limit => 80
    t.string  "gender",            :limit => 80
    t.string  "race",              :limit => 80
    t.string  "household",         :limit => 80
    t.string  "family_role",       :limit => 80
    t.string  "marital_status",    :limit => 80
    t.string  "occupation",        :limit => 80
    t.string  "dwelling",          :limit => 80
    t.string  "ability_to_write",  :limit => 80
    t.string  "ability_to_read",   :limit => 80
    t.string  "status",            :limit => 80
    t.string  "minister",          :limit => 80
    t.string  "mother",            :limit => 80
    t.string  "father",            :limit => 80
    t.string  "family",            :limit => 80
    t.date    "record_date"
    t.string  "husband",           :limit => 80
    t.string  "wife",              :limit => 80
    t.string  "record",            :limit => 80
    t.string  "owner",             :limit => 80
    t.string  "school",            :limit => 80
    t.string  "division",          :limit => 80
    t.string  "value",             :limit => 80
    t.string  "birth_month",       :limit => 80
    t.string  "disposition",       :limit => 80
    t.string  "birth_year",        :limit => 80
    t.string  "purchaser",         :limit => 80
    t.string  "legatee",           :limit => 80
    t.string  "deaf",              :limit => 80
    t.string  "value_notes",       :limit => 80
    t.string  "location_person",   :limit => 80
    t.string  "age_group",         :limit => 10, :null => false
  end

  add_index "src_table_data_wide_tmp", ["age"], :name => "age"
  add_index "src_table_data_wide_tmp", ["birthplace"], :name => "birthplace"
  add_index "src_table_data_wide_tmp", ["family_role"], :name => "family_role"
  add_index "src_table_data_wide_tmp", ["gender"], :name => "gender"
  add_index "src_table_data_wide_tmp", ["last_name"], :name => "last_name"
  add_index "src_table_data_wide_tmp", ["race"], :name => "race"
  add_index "src_table_data_wide_tmp", ["src_table_id", "src_table_row_num", "topic_type", "topic_ord"], :name => "src_table_id", :unique => true

  create_table "src_table_rel", :primary_key => "src_table_rel_id", :force => true do |t|
    t.integer "src_table_id",                     :null => false
    t.string  "subject_topic_type", :limit => 20, :null => false
    t.integer "subject_topic_ord",  :limit => 1,  :null => false
    t.string  "has_predicate",      :limit => 20, :null => false
    t.string  "object_topic_type",  :limit => 20, :null => false
    t.integer "object_topic_ord",   :limit => 1,  :null => false
  end

  add_index "src_table_rel", ["src_table_id", "subject_topic_type", "subject_topic_ord", "has_predicate", "object_topic_type", "object_topic_ord"], :name => "src_table_id", :unique => true

  create_table "src_table_topic", :primary_key => "src_table_topic_id", :force => true do |t|
    t.integer "src_table_id",                                :null => false
    t.string  "topic_type",   :limit => 20,                  :null => false
    t.integer "topic_ord",    :limit => 1,                   :null => false
    t.text    "topic_gloss",  :limit => 255,                 :null => false
    t.integer "distinct_lov", :limit => 1,   :default => -1, :null => false
  end

  add_index "src_table_topic", ["src_table_id", "topic_type", "topic_ord"], :name => "src_table_id", :unique => true

  create_table "src_table_topic_prop", :primary_key => "src_table_topic_prop_id", :force => true do |t|
    t.string  "topic_type",    :limit => 20, :null => false
    t.string  "prop_name",     :limit => 80, :null => false
    t.string  "prop_type",     :limit => 20, :null => false
    t.integer "prop_ord",      :limit => 1,  :null => false
    t.integer "prop_priority",               :null => false
  end

  add_index "src_table_topic_prop", ["topic_type", "prop_name"], :name => "topic_type", :unique => true

  create_table "src_tables", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "st_14_1865-81_marriage_ed", :id => false, :force => true do |t|
    t.string  "A",                            :limit => 138
    t.integer "ROW_NUM"
    t.string  "Surname, groom",               :limit => 11
    t.string  "First Name, groom",            :limit => 15
    t.integer "Age, groom"
    t.string  "Gender, groom",                :limit => 4
    t.integer "Birth Year Groom, calculated"
    t.string  "Race, groom, calculated",      :limit => 7
    t.string  "Status, groom",                :limit => 8
    t.string  "Birthplace, groom",            :limit => 15
    t.string  "Residence, groom",             :limit => 15
    t.string  "Work, groom",                  :limit => 24
    t.string  "Father of the Groom",          :limit => 13
    t.string  "Mother of the Groom",          :limit => 11
    t.string  "Surname, Bride",               :limit => 11
    t.string  "First Name, Bride",            :limit => 14
    t.string  "Age, Bride",                   :limit => 3
    t.string  "Gender, bride",                :limit => 6
    t.integer "Birth Year Bride"
    t.string  "Race, bride, calculated",      :limit => 7
    t.string  "Status, Bride",                :limit => 6
    t.string  "Birthplace, Bride",            :limit => 24
    t.string  "Residence, bride",             :limit => 9
    t.string  "Father of the Bride",          :limit => 10
    t.string  "Mother of the Bride",          :limit => 11
    t.string  "minister surname",             :limit => 12
    t.string  "minister first name",          :limit => 18
    t.integer "page"
    t.integer "year"
    t.integer "month"
    t.string  "day",                          :limit => 3
    t.string  "x_person_0_title",             :limit => 80,  :null => false
    t.string  "x_person_1_title",             :limit => 80,  :null => false
    t.string  "x_person_2_title",             :limit => 80,  :null => false
    t.string  "x_person_3_title",             :limit => 80,  :null => false
    t.string  "x_person_4_title",             :limit => 80,  :null => false
    t.string  "x_person_5_title",             :limit => 80,  :null => false
    t.string  "x_person_6_title",             :limit => 80,  :null => false
    t.string  "x_date_0_title",               :limit => 80,  :null => false
  end

  create_table "st_20_ChurchMembership_1851_1880", :id => false, :force => true do |t|
    t.integer "ROW_NUM"
    t.string  "CHURCH",                :limit => 43
    t.string  "DENOMINATION",          :limit => 12
    t.string  "MEMBER_SURNAME",        :limit => 11
    t.string  "MEMBER_PREFIX",         :limit => 5
    t.string  "MEMBER_FIRSTNAME",      :limit => 14
    t.string  "MEMBER_MIDDLENAME",     :limit => 6
    t.string  "MEMBER_GENDER",         :limit => 1
    t.string  "MEMBER_RACE",           :limit => 11
    t.string  "OWNER_SURNAME",         :limit => 12
    t.string  "OWNER_PREFIX",          :limit => 6
    t.string  "OWNER_FIRSTNAME",       :limit => 10
    t.string  "OWNER_MIDDLENAME",      :limit => 9
    t.string  "OWNER_MIDDLENAME2",     :limit => 2
    t.string  "MONTH",                 :limit => 2
    t.string  "DAY",                   :limit => 2
    t.string  "YEAR",                  :limit => 4
    t.string  "MEMBER",                :limit => 1
    t.string  "DISMISSED",             :limit => 1
    t.string  "OTHER",                 :limit => 1
    t.string  "FREE",                  :limit => 1
    t.string  "NOTES",                 :limit => 197
    t.string  "NOTES2",                :limit => 42
    t.string  "SOURCE_PAGE",           :limit => 72
    t.string  "x_person_0_title",      :limit => 80,  :null => false
    t.string  "x_person_0_first_name", :limit => 80,  :null => false
    t.string  "x_person_0_last_name",  :limit => 80,  :null => false
    t.string  "x_person_1_title",      :limit => 80,  :null => false
    t.string  "x_person_1_first_name", :limit => 80,  :null => false
    t.string  "x_person_1_last_name",  :limit => 80,  :null => false
    t.string  "x_location_0_title",    :limit => 80,  :null => false
    t.string  "x_date_0_year",         :limit => 10,  :null => false
  end

  create_table "st_BirthRegister1", :id => false, :force => true do |t|
    t.integer "ROW_NUM"
    t.string  "First Name, Child",                                :limit => 18
    t.string  "Middle Name, Child",                               :limit => 10
    t.string  "Last Name, Child",                                 :limit => 10
    t.string  "Gender, Child",                                    :limit => 6
    t.string  "Status, Child",                                    :limit => 5
    t.string  "Race, Child, calculated",                          :limit => 7
    t.integer "Birth Year, Child"
    t.integer "Birth Month, Child"
    t.integer "Birth Day, Child"
    t.string  "Birth Place, Child",                               :limit => 26
    t.string  "Mother's First Name",                              :limit => 19
    t.string  "Mother's Last Name",                               :limit => 11
    t.string  "Race, Mother, calculated",                         :limit => 7
    t.string  "Father's First Name",                              :limit => 11
    t.string  "Father's Last Name",                               :limit => 10
    t.string  "Father's/Owner's Occupation",                      :limit => 14
    t.string  "Race, Father, calculated",                         :limit => 7
    t.string  "Mother and Child's Owner's First and Middle Name", :limit => 19
    t.string  "Mother and Child's Owner's Last Name",             :limit => 20
    t.string  "Informant's First/Middle Name (if not owner)",     :limit => 13
    t.string  "Informant's Last Name (if not owner)",             :limit => 16
    t.string  "Informant's relationship",                         :limit => 18
    t.string  "Remarks",                                          :limit => 50
    t.string  "Record",                                           :limit => 8
    t.integer "Page"
    t.integer "Line"
    t.string  "Parish",                                           :limit => 15
    t.string  "x_person_0_first_name",                            :limit => 80, :null => false
    t.string  "x_person_0_title",                                 :limit => 80, :null => false
    t.string  "x_person_1_title",                                 :limit => 80, :null => false
    t.string  "x_person_2_title",                                 :limit => 80, :null => false
    t.string  "x_person_3_title",                                 :limit => 80, :null => false
    t.string  "x_person_4_title",                                 :limit => 80, :null => false
    t.string  "x_date_0_title",                                   :limit => 10, :null => false
  end

  create_table "st_Census_Albemarle_1880", :primary_key => "ROW_NUM", :force => true do |t|
    t.text    "n_1",                                 :null => false
    t.text    "household",                           :null => false
    t.text    "person",                              :null => false
    t.text    "name",                                :null => false
    t.text    "middle",                              :null => false
    t.text    "surname",                             :null => false
    t.text    "relation",                            :null => false
    t.text    "marital_status",                      :null => false
    t.text    "gender",                              :null => false
    t.text    "race",                                :null => false
    t.text    "age",                                 :null => false
    t.text    "birthplace",                          :null => false
    t.text    "occupation",                          :null => false
    t.text    "fathers_birthplace",                  :null => false
    t.text    "mothers_birthplace",                  :null => false
    t.string  "x_person_0_first_name", :limit => 80, :null => false
    t.string  "x_person_0_title",      :limit => 80, :null => false
    t.float   "x_person_0_age",                      :null => false
    t.integer "x_person_0_birth_year",               :null => false
    t.string  "x_record_0_title",      :limit => 80, :null => false
    t.string  "x_date_0_title",        :limit => 10, :null => false
    t.integer "x_date_0_year",                       :null => false
  end

  create_table "st_Census_Fredericksville_1870", :primary_key => "ROW_NUM", :force => true do |t|
    t.text    "page_no",                             :null => false
    t.text    "reference",                           :null => false
    t.text    "division",                            :null => false
    t.text    "line_no",                             :null => false
    t.text    "dwelling",                            :null => false
    t.text    "family",                              :null => false
    t.text    "last_name",                           :null => false
    t.text    "first_name",                          :null => false
    t.text    "age",                                 :null => false
    t.text    "sex",                                 :null => false
    t.text    "color",                               :null => false
    t.text    "occupation",                          :null => false
    t.text    "real_est",                            :null => false
    t.text    "pers_est",                            :null => false
    t.text    "birth_place",                         :null => false
    t.text    "f_for_bir",                           :null => false
    t.text    "m_for_bir",                           :null => false
    t.text    "mo_born",                             :null => false
    t.text    "mo_marr",                             :null => false
    t.text    "att_school",                          :null => false
    t.text    "c_n_read",                            :null => false
    t.text    "c_n_write",                           :null => false
    t.text    "deaf",                                :null => false
    t.text    "m_21_yr",                             :null => false
    t.text    "vote_deny",                           :null => false
    t.text    "transcribers_remarks",                :null => false
    t.string  "x_person_0_title",      :limit => 80, :null => false
    t.float   "x_person_0_age",                      :null => false
    t.integer "x_person_0_birth_year",               :null => false
    t.string  "x_date_0_title",        :limit => 10, :null => false
    t.integer "x_date_0_year",                       :null => false
  end

  create_table "st_Census_Fredericksville_1870_OLD", :primary_key => "ROW_NUM", :force => true do |t|
    t.text   "page_no",                            :null => false
    t.text   "reference",                          :null => false
    t.text   "division",                           :null => false
    t.text   "line_no",                            :null => false
    t.text   "dwelling",                           :null => false
    t.text   "family",                             :null => false
    t.text   "last_name",                          :null => false
    t.text   "first_name",                         :null => false
    t.text   "age",                                :null => false
    t.text   "sex",                                :null => false
    t.text   "color",                              :null => false
    t.text   "occupation",                         :null => false
    t.text   "real_est",                           :null => false
    t.text   "pers_est",                           :null => false
    t.text   "birth_place",                        :null => false
    t.text   "f_for_bir",                          :null => false
    t.text   "m_for_bir",                          :null => false
    t.text   "mo_born",                            :null => false
    t.text   "mo_marr",                            :null => false
    t.text   "att_school",                         :null => false
    t.text   "c_n_read",                           :null => false
    t.text   "c_n_write",                          :null => false
    t.text   "deaf",                               :null => false
    t.text   "m_21_yr",                            :null => false
    t.text   "vote_deny",                          :null => false
    t.text   "transcribers_remarks",               :null => false
    t.string "x_person_0_title",     :limit => 80, :null => false
    t.string "x_date_0_title",       :limit => 10, :null => false
  end

  create_table "st_LouisaCoBurnleySlaveLists", :primary_key => "ROW_NUM", :force => true do |t|
    t.string  "Source",                             :limit => 6
    t.string  "Page number",                        :limit => 7
    t.string  "Source type",                        :limit => 22
    t.integer "year"
    t.integer "month"
    t.integer "day"
    t.string  "First/middle names",                 :limit => 14
    t.string  "Surname",                            :limit => 8
    t.string  "Male_Female",                        :limit => 6
    t.string  "Man_Boy_Woman_Girl",                 :limit => 5
    t.string  "Birth year approx",                  :limit => 10
    t.integer "Value"
    t.string  "Occupation",                         :limit => 10
    t.string  "Disposition",                        :limit => 10
    t.string  "Owner first/middle names",           :limit => 10
    t.string  "Owner last name",                    :limit => 7
    t.string  "Purchaser_Hirer first_middle names", :limit => 10
    t.string  "Purchaser_Hirer last name",          :limit => 10
    t.string  "Legatee first/midde names",          :limit => 15
    t.string  "Legatee last name",                  :limit => 7
    t.string  "Notes",                              :limit => 118
    t.string  "x_person_0_title",                   :limit => 80,  :null => false
    t.string  "x_person_0_race",                    :limit => 10,  :null => false
    t.string  "x_person_1_title",                   :limit => 80,  :null => false
    t.string  "x_person_2_title",                   :limit => 80,  :null => false
    t.string  "x_person_3_title",                   :limit => 80,  :null => false
    t.string  "x_date_0_title",                     :limit => 10,  :null => false
    t.integer "x_date_0_year",                                     :null => false
  end

  create_table "st_Marriage_1865-81_rev", :primary_key => "ROW_NUM", :force => true do |t|
    t.text    "page",                                :null => false
    t.text    "year",                                :null => false
    t.text    "month",                               :null => false
    t.text    "day",                                 :null => false
    t.text    "col_5",                               :null => false
    t.text    "his_surname",                         :null => false
    t.text    "his_first_name",                      :null => false
    t.text    "his_age",                             :null => false
    t.text    "his_status",                          :null => false
    t.text    "his_birthplace",                      :null => false
    t.text    "his_residence",                       :null => false
    t.text    "his_work",                            :null => false
    t.text    "his_father",                          :null => false
    t.text    "his_mother",                          :null => false
    t.text    "her_surname",                         :null => false
    t.text    "her_first_name",                      :null => false
    t.text    "her_age",                             :null => false
    t.text    "her_status",                          :null => false
    t.text    "her_birthplace",                      :null => false
    t.text    "her_residence",                       :null => false
    t.text    "her_father",                          :null => false
    t.text    "her_mother",                          :null => false
    t.text    "minister_surname",                    :null => false
    t.text    "minister_first_name",                 :null => false
    t.text    "col_25",                              :null => false
    t.string  "x_person_0_title",      :limit => 80, :null => false
    t.string  "x_person_0_race",       :limit => 10, :null => false
    t.string  "x_person_0_gender",     :limit => 10, :null => false
    t.float   "x_person_0_age",                      :null => false
    t.integer "x_person_0_birth_year",               :null => false
    t.string  "x_person_1_title",      :limit => 80, :null => false
    t.string  "x_person_1_race",       :limit => 10, :null => false
    t.string  "x_person_1_gender",     :limit => 10, :null => false
    t.float   "x_person_1_age",                      :null => false
    t.integer "x_person_1_birth_year",               :null => false
    t.string  "x_person_2_title",      :limit => 80, :null => false
    t.string  "x_person_3_title",      :limit => 80, :null => false
    t.string  "x_person_4_title",      :limit => 80, :null => false
    t.string  "x_person_5_title",      :limit => 80, :null => false
    t.string  "x_person_6_title",      :limit => 80, :null => false
    t.string  "x_date_0_title",        :limit => 10, :null => false
    t.integer "x_date_0_year",                       :null => false
  end

  create_table "st_PersonalPropTax_Burnley_1866-69", :primary_key => "ROW_NUM", :force => true do |t|
    t.text    "year",                                     :null => false
    t.text    "district",                                 :null => false
    t.text    "page",                                     :null => false
    t.text    "line",                                     :null => false
    t.text    "first_name",                               :null => false
    t.text    "middle_name",                              :null => false
    t.text    "surname",                                  :null => false
    t.text    "location_place",                           :null => false
    t.text    "location_person_first_name",               :null => false
    t.text    "location_person_surname",                  :null => false
    t.text    "males_16_plus",                            :null => false
    t.text    "males_21_plus",                            :null => false
    t.text    "property",                                 :null => false
    t.text    "tax",                                      :null => false
    t.text    "notes",                                    :null => false
    t.string  "x_person_0_first_name",      :limit => 20, :null => false
    t.string  "x_person_0_title",           :limit => 80, :null => false
    t.string  "x_person_0_race",            :limit => 10, :null => false
    t.string  "x_person_1_title",           :limit => 80, :null => false
    t.string  "x_date_0_title",             :limit => 10, :null => false
    t.integer "x_date_0_year",                            :null => false
  end

  create_table "st_WillBooks1854on", :primary_key => "ROW_NUM", :force => true do |t|
    t.string  "Source",                               :limit => 5
    t.integer "Page number"
    t.string  "Source type",                          :limit => 8
    t.integer "year"
    t.integer "month"
    t.integer "day"
    t.string  "First/middle  names",                  :limit => 23
    t.string  "Surname",                              :limit => 9
    t.string  "Male/Female",                          :limit => 6
    t.string  "Man/Boy/Woman/Girl",                   :limit => 49
    t.integer "Birth year (approx)"
    t.integer "Value"
    t.string  "Occupation",                           :limit => 10
    t.string  "Disposition",                          :limit => 25
    t.string  "Owner's first/middle names",           :limit => 24
    t.string  "Owner's last name",                    :limit => 19
    t.string  "Purchaser/Hirer's first/middle names", :limit => 23
    t.string  "Purchaser/Hirer's last name",          :limit => 29
    t.string  "Legatee's first/midde names",          :limit => 24
    t.string  "Legatee's last name",                  :limit => 24
    t.string  "Notes",                                :limit => 142
    t.string  "x_person_0_title",                     :limit => 80,  :null => false
    t.string  "x_person_0_race",                      :limit => 10,  :null => false
    t.float   "x_person_0_age",                                      :null => false
    t.string  "x_person_1_title",                     :limit => 80,  :null => false
    t.string  "x_person_2_title",                     :limit => 80,  :null => false
    t.string  "x_person_3_title",                     :limit => 80,  :null => false
    t.string  "x_date_0_title",                       :limit => 10,  :null => false
    t.integer "x_date_0_year",                                       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                       :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                                 :default => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "wide_tables", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "z_Sources", :id => false, :force => true do |t|
    t.string "Source",        :limit => 6
    t.string "Source Detail", :limit => 29
  end

end
