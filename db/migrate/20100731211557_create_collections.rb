class CreateCollections < ActiveRecord::Migration
  def self.up
    create_table :collections do |t|
      t.date :collected_on
      t.string :name
      t.text :notes
      t.integer :collected_by
      t.decimal :amount, :precision =>10, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :collections
  end
end
