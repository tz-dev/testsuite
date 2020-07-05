class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer :user_id
      t.integer :exam_id
      t.string :settings
      t.integer :questions
      t.string :time
      t.string :result

      t.timestamps
    end
  end
end
