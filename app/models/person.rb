class Person < ActiveRecord::Base
  belongs_to :household
  has_many :contributions
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
