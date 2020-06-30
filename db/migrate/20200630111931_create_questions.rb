class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :exam
      t.string :q_type
      t.text :q_text
      t.string :q_answer001
      t.boolean :q_answer001_active
      t.boolean :q_answer001_correct
      t.string :q_answer002
      t.boolean :q_answer002_active
      t.boolean :q_answer002_correct
      t.string :q_answer003
      t.boolean :q_answer003_active
      t.boolean :q_answer003_correct
      t.string :q_answer004
      t.boolean :q_answer004_active
      t.boolean :q_answer004_correct
      t.string :q_answer005
      t.boolean :q_answer005_active
      t.boolean :q_answer005_correct
      t.string :q_answer006
      t.boolean :q_answer006_active
      t.boolean :q_answer006_correct
      t.string :q_answer007
      t.boolean :q_answer007_active
      t.boolean :q_answer007_correct
      t.string :q_answer008
      t.boolean :q_answer008_active
      t.boolean :q_answer008_correct
      t.string :q_answer009
      t.boolean :q_answer009_active
      t.boolean :q_answer009_correct
      t.string :q_answer010
      t.boolean :q_answer010_active
      t.boolean :q_answer010_correct

      t.timestamps
    end
  end
end
