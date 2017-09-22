class AddTypeofToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :ltype, :string
  end
end
