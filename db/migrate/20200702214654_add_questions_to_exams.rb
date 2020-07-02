class AddQuestionsToExams < ActiveRecord::Migration[5.1]
  def change
    add_column :exams, :questions, :integer
  end
end
