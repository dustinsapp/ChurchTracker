class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.datetime :date
      t.text :comments
      t.integer :total_attendance
      t.references :contribution

      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
