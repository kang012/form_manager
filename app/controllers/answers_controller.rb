class AnswersController < ApplicationController
  def new
  end

  def create
    answer = params[:answer]
    question = Question.find(params[:question_id])
    question.answers.push(answer)
    question.save
    flash[:notice] = 'New answer has been added'
    redirect_to form_path(params[:form_id])
  end

  def edit
    @index = params[:index]
  end

  def update
    question = Question.find(params[:question_id])
    question.answers[params[:answer_index].to_i] = params[:answer]
    question.save
    flash[:notice] = 'Answer has been updated'
    redirect_to form_path(params[:form_id])
  end

  def destroy
    question = Question.find(params[:question_id])
    question.answers.delete_at params[:index].to_i
    question.save
    flash[:notice] = 'Answer has been deleted'
    redirect_to form_path(params[:form_id])
  end
end
