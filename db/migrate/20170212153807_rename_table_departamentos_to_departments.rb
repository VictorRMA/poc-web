class RenameTableDepartamentosToDepartments < ActiveRecord::Migration[5.0]
  def change
    rename_table :departamentos, :departments
  end
end
