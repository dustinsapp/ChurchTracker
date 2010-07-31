class Collection < ActiveRecord::Base
  belongs_to :collector, :class_name => "User", :foreign_key => "collected_by"
  
  validates_presence_of :amount, :collected_by
end
