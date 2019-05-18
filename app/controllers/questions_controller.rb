class QuestionsController < ApplicationController
  before_action :init_form

  def new
    @question = @form.questions.new
  end

  def edit
    @question = @form.questions.find_by(id: params[:id])
  end

  def create
    question = @form.questions.new(question_params)
    question.save
    flash[:notice] = ' A new question has been created'
    redirect_to user_form_path(current_user, params[:form_id])
  end

  def update
    question = Question.find(params[:id])
    return unless question.update(question_params)

    flash[:notice] = 'Question has been updated'
    redirect_to user_form_path(current_user, params[:form_id])
  end

  def destroy
    question = Question.find(params[:id])
    return unless question.destroy

    flash[:notice] = 'Question has been deleted'
    redirect_to user_form_path(current_user, params[:form_id])
  end

  def show
    @question = @form.question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:question_text, :question_type, :form_id)
  end

  def init_form
    @form = current_user.forms.find(params[:form_id])
  end
end
