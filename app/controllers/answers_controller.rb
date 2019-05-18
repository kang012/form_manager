class AnswersController < ApplicationController
  before_action :init_question

  def new
  end

  def create
    answer = params[:answer]
    question = Question.find(params[:question_id])
    question.answers.push(answer)
    question.save
    flash[:notice] = 'New answer has been added'
    redirect_to user_form_path(current_user, @form, @question)
  end

  def edit
    @index = params[:index]
  end

  def update
    question = Question.find(params[:question_id])
    question.answers[params[:answer_index].to_i] = params[:answer]
    question.save
    flash[:notice] = 'Answer has been updated'
    redirect_to user_form_path(current_user, @form, @question)
  end

  def destroy
    question = Question.find(params[:question_id])
    question.answers.delete_at params[:index].to_i
    question.save
    flash[:notice] = 'Answer has been deleted'
    redirect_to user_form_path(current_user, @form, @question)
  end

  private

  def init_question
    @form = current_user.forms.find(params[:form_id])
    @question = @form.questions.find(params[:question_id])
  end
end
