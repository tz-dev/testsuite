class RemoveHintsFromExams < ActiveRecord::Migration[5.1]
  def change
    remove_column :exams, :hints, :integer
  end
end
