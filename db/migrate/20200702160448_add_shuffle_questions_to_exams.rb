class AddShuffleQuestionsToExams < ActiveRecord::Migration[5.1]
  def change
    add_column :exams, :shuffle_questions, :boolean
  end
end
