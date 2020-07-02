class AddChecksToExams < ActiveRecord::Migration[5.1]
  def change
    add_column :exams, :checks, :boolean
  end
end
