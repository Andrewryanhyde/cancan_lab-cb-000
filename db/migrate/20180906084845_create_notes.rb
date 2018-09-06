class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :content
      t.string :name

      t.timestamps null: false
    end
  end
end
