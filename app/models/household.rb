class Household < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :people
  has_many :contributions
end
