class WideTablesController < ApplicationController
  active_scaffold :wide_table do |conf|
  end
  
  def search_tables
    
  end
  
  def find_results
    @wide_tables = WideTable.find(:all, :conditions => ["first_name like ?","%#{params[:first_name]}%"], :limit => 100)
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
    respond_to do |format| 
      format.js do
      end
    end
  end
end 