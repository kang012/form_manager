class AnsweredForm < ApplicationRecord
  belongs_to :form
  has_many :answered_questions

  accepts_nested_attributes_for :answered_questions
end
