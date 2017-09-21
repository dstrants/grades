class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string :code
      t.integer :semester
      t.integer :grade
      t.string :name
      t.integer :ects

      t.timestamps
    end
  end
end
