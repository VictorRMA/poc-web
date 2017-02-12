class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :departments, :nome, :name
  end
end
