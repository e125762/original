class AddDefaultTousers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :name, false, "no_name"
    change_column_null :users, :email, false, "a@a.a"
  end
end
