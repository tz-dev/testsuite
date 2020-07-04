class AddTimerToExams < ActiveRecord::Migration[5.1]
  def change
    add_column :exams, :timer, :boolean
  end
end
