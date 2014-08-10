class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :description
      t.integer :order
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
