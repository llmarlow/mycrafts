class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.references :project, index: true
      t.integer :hours

      t.timestamps
    end
  end
end
