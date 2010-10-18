class CreateAttendanceCategories < ActiveRecord::Migration
  def self.up
    create_table :attendance_categories do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :attendance_categories
  end
end
