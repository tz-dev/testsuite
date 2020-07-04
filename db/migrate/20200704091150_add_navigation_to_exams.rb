class AddNavigationToExams < ActiveRecord::Migration[5.1]
  def change
    add_column :exams, :navigation, :boolean
  end
end
