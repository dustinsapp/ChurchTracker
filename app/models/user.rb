class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :collections, :foreign_key => "collected_by"
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
