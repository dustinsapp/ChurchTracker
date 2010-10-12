class HomeController < ApplicationController
  def index
    @collections = Collection.find(:all, :select => "extract(month from collected_on) as giving_month, extract(year from collected_on) as giving_year, SUM(amount) as monthly_sum",:group => "giving_month, giving_year", :order => "giving_year, giving_month")
    
    current_month = Time.now.month
    current_year = Time.now.year
    last_month = 1.months.ago.month
    last_month_year = 1.months.ago.year
    
    @mtd_giving = Collection.sum("amount", :conditions => "extract(month from collected_on) = #{current_month} and extract(year from collected_on) = #{current_year}")
    @last_month_giving = Collection.sum("amount", :conditions => "extract(month from collected_on) = #{last_month} and extract(year from collected_on) = #{last_month_year}")
  end

end
