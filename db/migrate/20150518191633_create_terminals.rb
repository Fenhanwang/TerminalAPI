class CreateTerminals < ActiveRecord::Migration
  def change
    create_table :terminals do |t|
      t.string :name
      t.string :description
      t.text :attributes

      t.timestamps null: false
    end
  end
end
