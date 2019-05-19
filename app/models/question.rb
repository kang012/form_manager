class Question < ApplicationRecord
  belongs_to :form
  has_many :answered_questions
end
