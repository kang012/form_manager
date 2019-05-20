class AnsweredQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :answered_form

  def same_result
    AnsweredQuestion.where(question_id: question_id, user_answer: user_answer).count
  end
end
