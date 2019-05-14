class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :question_text
      t.text :question_type
      t.text :answers, array: true, default: []

      t.timestamps
    end
  end
end
