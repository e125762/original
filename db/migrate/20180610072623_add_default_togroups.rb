class AddDefaultTogroups < ActiveRecord::Migration[5.2]
  def change
    change_column_null :groups, :title, false, "title"
    change_column_null :groups, :description, false, "description"
  end
end
