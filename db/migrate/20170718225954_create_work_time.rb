class CreateWorkTime < ActiveRecord::Migration[5.0]
  def change
    create_table :work_times do |t|
      t.text :description
      t.datetime :datetime_start
      t.datetime :datetime_end
      t.integer :employee_id
      t.integer :task_id

      t.timestamps
    end
  end
end
