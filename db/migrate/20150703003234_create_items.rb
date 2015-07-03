class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.datetime :duedate
      t.boolean :complete

      t.timestamps null: false
    end
  end
end
