class Collection < ActiveRecord::Base
  belongs_to :collector, :class_name => "User", :foreign_key => "collected_by"
  has_many :contributions, :order => "received_on desc, amount desc"
  
  validates_presence_of :amount, :collected_by, :name
  
  def contribution_total
    contributions.sum(:amount)
  end

  def contribution_variance
    amount - contributions.sum(:amount)
  end
end
