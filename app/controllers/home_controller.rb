class HomeController < ApplicationController
  def index
    @collections = Collection.find(:all, :select => "extract(month from collected_on) as giving_month, extract(year from collected_on) as giving_year, SUM(amount) as monthly_sum",:group => "giving_month, giving_year", :order => "giving_year, giving_month")
    @mtd_giving = Collection.sum("amount", :conditions => "extract(month from collected_on) = extract(month from now())")
    @last_month_giving = Collection.sum("amount", :conditions => "extract(month from collected_on) = extract(month from now())-1")
  end

end
