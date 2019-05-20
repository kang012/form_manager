class Question < ApplicationRecord
  belongs_to :form
  has_many :answered_questions

  def answers_stat
    total = answered_questions.count
    stat = {}
    answers.each_with_index do |answer, index|
      stat[answer] = (AnsweredQuestion.where(question_id: id, user_answer: index.to_s).count.to_f * 100) / total 
    end
    stat
  end
end
