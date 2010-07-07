class CreateSubmissions < ActiveRecord::Migration
  def self.up
    create_table :submissions do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.references :survey

      t.timestamps
    end
  end

  def self.down
    drop_table :submissions
  end
end
