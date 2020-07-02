class AddShuffleAnswersToExams < ActiveRecord::Migration[5.1]
  def change
    add_column :exams, :shuffle_answers, :boolean
  end
end
