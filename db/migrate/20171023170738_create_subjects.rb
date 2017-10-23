class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :code
      t.integer :ects
      t.integer :semester
      t.integer :ltype

      t.timestamps
    end
  end
end
