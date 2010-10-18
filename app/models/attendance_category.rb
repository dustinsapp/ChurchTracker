class AttendanceCategory < ActiveRecord::Base
  has_many :attendances
end
