class CreateAnsweredQuestion < ActiveRecord::Migration[5.1]
  def change
    create_table :answered_questions do |t|
      t.belongs_to :answered_form
      t.belongs_to :question
      t.text :user_answer

      t.timestamps
    end
  end
end
