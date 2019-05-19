class AnsweredFormsController < ApplicationController
  def new
    @form = Form.find(params[:form_id])
    @answered_form = current_user.answered_forms.new
    @form.questions.each do |question|
       @answered_form.answered_questions.new(question_id: question.id)
    end
  end

  def create
    answered_form = current_user.answered_forms.new(answered_form_params)
    answered_form.save
  end

  def show
  end


  private

  def answered_form_params
    params.require(:answered_form).permit(:form_id, answered_questions_attributes: [:user_answer, :question_id])
  end

end