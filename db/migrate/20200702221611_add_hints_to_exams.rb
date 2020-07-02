class AddHintsToExams < ActiveRecord::Migration[5.1]
  def change
    add_column :exams, :hints, :boolean
  end
end
