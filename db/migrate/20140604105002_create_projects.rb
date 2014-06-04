class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :width
      t.integer :height
      t.string :type
      t.string :fabric_type
      t.integer :fabric_count
      t.string :fabric_colour
      t.string :thread_type

      t.timestamps
    end
  end
end
