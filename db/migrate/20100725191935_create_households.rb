class CreateHouseholds < ActiveRecord::Migration
  def self.up
    create_table :households do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone1
      t.string :phone2

      t.timestamps
    end
  end

  def self.down
    drop_table :households
  end
end
