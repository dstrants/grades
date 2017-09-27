class AddSelectedToLesson < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :selected, :boolean
  end
end
