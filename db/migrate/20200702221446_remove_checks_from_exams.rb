class RemoveChecksFromExams < ActiveRecord::Migration[5.1]
  def change
    remove_column :exams, :checks, :integer
  end
end
