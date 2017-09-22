class ChangeTypeofInLessons < ActiveRecord::Migration[5.1]
  def up
   change_column :lessons, :ltype, :integer
  end

 def down
   change_column :lessons, :ltype, :string
 end
end
