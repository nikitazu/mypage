class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :title
      t.string :description
      t.string :url
      t.date :released
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
