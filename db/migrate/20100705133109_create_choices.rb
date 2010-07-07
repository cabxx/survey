class CreateChoices < ActiveRecord::Migration
  def self.up
    create_table :choices do |t|
      t.text :content
      t.integer :score
      t.integer :next
      t.references :question

      t.timestamps
    end
  end

  def self.down
    drop_table :choices
  end
end
