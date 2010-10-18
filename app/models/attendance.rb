class Attendance < ActiveRecord::Base
  belongs_to :service
  belongs_to :attendance_category
end
