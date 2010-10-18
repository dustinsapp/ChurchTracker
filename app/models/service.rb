class Service < ActiveRecord::Base
  belongs_to :contribution
  has_many :attendances, :dependent => :destroy
  
  validates_numericality_of :total_attendance
end
