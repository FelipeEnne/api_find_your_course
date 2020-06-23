class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :owner
      t.integer :starts
      t.integer :value
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
