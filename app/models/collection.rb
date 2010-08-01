class Collection < ActiveRecord::Base
  belongs_to :collector, :class_name => "User", :foreign_key => "collected_by"
  has_many :contributions
  
  validates_presence_of :amount, :collected_by, :name
end
