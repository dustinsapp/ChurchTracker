class CreateAttendances < ActiveRecord::Migration
  def self.up
    create_table :attendances do |t|
      t.references :service
      t.references :attendance_category
      t.integer :attendance

      t.timestamps
    end
  end

  def self.down
    drop_table :attendances
  end
end
