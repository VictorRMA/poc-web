class AddTimestampsToDepartamentos < ActiveRecord::Migration[5.0]
  def change
    add_column :departamentos, :created_at, :datetime
    add_column :departamentos, :updated_at, :datetime
  end
end
