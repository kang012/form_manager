class AnsweredQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :answered_form
end