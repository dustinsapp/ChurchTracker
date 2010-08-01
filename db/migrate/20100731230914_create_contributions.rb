class CreateContributions < ActiveRecord::Migration
  def self.up
    create_table :contributions do |t|
      t.references :person
      t.references :household
      t.references :collection
      t.integer :contribution_type
      t.date :received_on
      t.references :fund
      t.decimal :amount, :precision =>10, :scale => 2
      t.string :reference
      t.text :memo

      t.timestamps
    end
  end

  def self.down
    drop_table :contributions
  end
end
