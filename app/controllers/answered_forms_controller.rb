class AnsweredFormsController < ApplicationController
  def new
    unless current_user
      store_location
      redirect_to login_path
    end
    @form = Form.find(params[:form_id])
    @answered_form = AnsweredForm.new
    @form.questions.each do |question|
      @answered_form.answered_questions.new(question_id: question.id)
    end
  end

  def create
    answered_form = current_user.answered_forms.new(answered_form_params)
    answered_form.save
    flash[:notice] = 'You answers has been submitted'
    redirect_to user_forms_path current_user
  end

  private

  def answered_form_params
    params.require(:answered_form).permit(:form_id, answered_questions_attributes: [:user_answer, :question_id])
  end
end
