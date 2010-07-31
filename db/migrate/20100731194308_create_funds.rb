class CreateFunds < ActiveRecord::Migration
  def self.up
    create_table :funds do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :funds
  end
end
