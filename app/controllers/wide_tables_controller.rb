class WideTablesController < ApplicationController
  before_filter :authenticate_user!
  
  active_scaffold :wide_table do |conf|
  end
  
  def search_tables
    @tables = SrcTable.find :all
    @carts = []
    current_user.collection_groups.each do |g|
      @carts += g.collections
    end
  end
  
  def find_results
    str = ''
    values = []
    @search_terms = ''

    if params[:first_name] != nil and params[:first_name] != ''
      str += ' and ' if str != ''
      if params[:use_soundex] == '1'
        str += 'first_name sounds like ?'
      else
        str += 'first_name like ?'
      end
      values << "%#{params[:first_name]}%"
      @search_terms += ', ' if @search_terms != ''
      @search_terms += "First name = #{params[:first_name]}"
    end
    if params[:last_name] != nil and params[:last_name] != ''
      str += ' and ' if str != ''
      if params[:use_soundex] == '1'
        str += 'last_name sounds like ?'
      else
        str += 'last_name like ?'
      end
      values << "%#{params[:last_name]}%"
      @search_terms += ', ' if @search_terms != ''
      @search_terms += "Last name = #{params[:last_name]}"
    end
    if params[:owner_purchaser_etc] != nil and params[:owner_purchaser_etc] != ''
      str += ' and ' if str != ''
      if params[:use_soundex] == '1'
        str += 'owner sounds like ?'
      else
        str += 'owner like ?'
      end
      values << "%#{params[:owner_purchaser_etc]}%"
      @search_terms += ', ' if @search_terms != ''
      @search_terms += "owner, purchaser, etc = #{params[:owner_purchaser_etc]}"
    end
    if params[:birth_year] != nil and params[:birth_year] != ''
      start = params[:birth_year].to_i
      stop = start
      if params[:birth_year_range] != nil and params[:birth_year_range] != ''
        start -= params[:birth_year_range].to_i
        stop += params[:birth_year_range].to_i
        @search_terms += ', ' if @search_terms != ''
        @search_terms += "Birth year = #{params[:birth_year]} +/-#{params[:birth_year_range]} years"
      else
        @search_terms += ', ' if @search_terms != ''
        @search_terms += "Birth year = #{start}"
      end
      str += ' and ' if str != ''
      str += 'birth_year >= ? and birth_year <= ?'
      values += [start,stop]
    end
    if params[:record_year] != nil and params[:record_year] != ''
      start = params[:record_year].to_i
      stop = start
      if params[:record_year_end] != nil and params[:record_year_end] != ''
        stop += params[:record_year_end].to_i
        @search_terms += ', ' if @search_terms != ''
        @search_terms += "Record years = #{params[:record_year]}-#{params[:record_year_end]}"
      else
        @search_terms += ', ' if @search_terms != ''
        @search_terms += "Record year = #{start}"
      end
      str += ' and ' if str != ''
      str += 'record_year >= ? and record_year <= ?'
      values += [start,stop]
    end
    if params[:race] != nil
      r_str = ''
      s_str = ''
      params[:race].each do |race|
        s_str += ' or ' if s_str != ''
        s_str += 'race like ?'
        values << "%#{race}%"
        r_str += ', ' if r_str != ''
        r_str += race
      end
      str += ' and ' if str != ''
      str += "(#{s_str})"
      @search_terms += ', ' if @search_terms != ''
      @search_terms += "race = #{r_str}"
    end
    if params[:gender] != nil
      r_str = ''
      s_str = ''
      params[:gender].each do |gender|
        s_str += ' or ' if s_str != ''
        s_str += 'gender like ?'
        values << "#{gender}"
        r_str += ', ' if r_str != ''
        r_str += gender
      end
      str += ' and ' if str != ''
      str += "(#{s_str})"
      @search_terms += ', ' if @search_terms != ''
      @search_terms += "gender = #{r_str}"
    end
    if params[:tables] != nil
      r_str = ''
      s_str = ''
      params[:tables].each do |table|
        s_str += ' or ' if s_str != ''
        s_str += 'src_table_id = ?'
        values << table
        r_str += ', ' if r_str != ''
        r_str += "#{table}"
      end
      str += ' and ' if str != ''
      str += "(#{s_str})"
      @search_terms += ', ' if @search_terms != ''
      @search_terms += "Source table = #{r_str}"
    end
    
    conditions = [str] + values
    
    @wide_tables = WideTable.find(:all, :conditions => conditions, :limit => 1000)
    # render :update do |page|
    #   # page.replace 'search_results', 'results'
    # end
    # render :text => 'lllll'
    respond_to do |format| 
      format.js do
        # render(:result_list) do |page|
        #   page.replace_html 'search_results', '========='
        # end
      end
    end
  end

  def show_result
    @wide_table = WideTable.find(params[:id])
    @source = SrcTable.find(@wide_table.src_table_id)
    respond_to do |format| 
      format.js do
      end
    end
  end

  def update_results
    order = ''
    if params[:field] == 'household'
      order = 'src_table_row_num asc'
    end
    @value = [params[:field], params[:id]]
    @wide_tables = WideTable.find(:all, :conditions => ["#{params[:field]} = ?", params[:id]], :order => order, :limit => 1000)
    @search_terms = "#{params[:field].humanize}: #{params[:id]}"
    respond_to do |format| 
      format.js do
      end
    end    
  end

  def show_next
    order = ''
    if params[:field] == 'household'
      order = 'src_table_row_num asc'
    end
    @value = [params[:field], params[:id]]
    @wide_tables = WideTable.find(:all, :conditions => ["#{params[:field]} = ?", params[:id]], :order => order, :limit => 1000)
    @search_terms = "#{params[:field].humanize}: #{params[:id]}"
    respond_to do |format| 
      format.js do
      end
    end    
  end
  
  def add_to_cart
    order = ''
    y = HypItem.new
    y.wide_table_id = params[:id]
    y.hyp_field = params[:field]
    y.hyp_value = params[:value]
    y.save
    @cart = HypItem.find :all
    respond_to do |format| 
      format.js do
      end
    end    
  end

  def remove_hyp
    order = ''
    y = HypItem.find(params[:id])
    id = y.collection.id
    y.destroy
    collection = Collection.find id
    @hyp_name = collection.name
    @cart = collection.hyp_items
    respond_to do |format| 
      format.js do
      end
    end    
  end

  def view_hyp
    order = ''
    @wide_table = WideTable.find params[:id]
    @source = SrcTable.find(@wide_table.src_table_id)
    respond_to do |format| 
      format.js do
      end
    end    
  end

  def add_to_group
    @group = nil
    if (params[:group] == nil or params[:group] == '') and (params[:new_group] == nil or params[:new_group] == '')
      render :js => "$('#name_error').html('Must supply a name!')"
    else
      if (params[:group] != nil and params[:group] != '')
        @group = CollectionGroup.find params[:group]
      else
        @group = CollectionGroup.create(:name => params[:new_group])
        current_user.collection_groups << @group
        debugger
      end
    end
    respond_to do |format| 
      format.js do
      end
    end    
  end
  
  def add_to_collection
    @hyp_name = ''
    collection = nil
    if (params[:hypothesis] == nil or params[:hypothesis] == '') and (params[:new_hypothesis] == nil or params[:new_hypothesis] == '')
      render :js => "$('#name_error').html('Must supply a name!')"
    else
      if params[:hypothesis] != nil and params[:hypothesis] != ''
        collection = Collection.find(params[:hypothesis])
        @hyp_name = collection.name
      else
        collection = Collection.new
        collection.name = params[:new_hypothesis]
        @hyp_name = params[:new_hypothesis]
        collection.group_id = params[:group_id]
        collection.save
        
      end
      if params[:result_ids] != nil and params[:result_ids] != ''
        params[:result_ids].split(',').each do |id|
          factoid = HypItem.new
          factoid.wide_table_id = id.to_i
          factoid.hyp_field = params[:field_name]
          factoid.hyp_value = params[:field_value]
          factoid.save
          collection.hyp_items << factoid
        end
      else
        factoid = HypItem.new
        factoid.wide_table_id = params[:src_table]
        factoid.hyp_field = params[:field_name]
        factoid.hyp_value = params[:field_value]
        # factoid.collection = collection
        factoid.save
        collection.hyp_items << factoid
      end
      @cart = collection.hyp_items
      respond_to do |format| 
        format.js do
        end
      end    
    end
    
  end
  
  def remove_hypothesis
    c = Collection.find_by_name(params[:id])
    c.hyp_items.each {|h| h.destroy}
    c.destroy
    respond_to do |format| 
      format.js do
      end
    end    
  end
  
  def final_facts
    @collections = Collection.find :all
  end
end 