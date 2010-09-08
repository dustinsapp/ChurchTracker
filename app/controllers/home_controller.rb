class HomeController < ApplicationController
  def index
    @collections = Collection.find(:all, :select => "month(collected_on) as giving_month, year(collected_on) as giving_year, SUM(amount) as monthly_sum",:group => "month(collected_on), year(collected_on)", :order => "giving_year, giving_month")
    @mtd_giving = Collection.sum("amount", :conditions => "month(collected_on) = MONTH(NOW())")
    @last_month_giving = Collection.sum("amount", :conditions => "month(collected_on) = MONTH(NOW())-1")
  end

end
