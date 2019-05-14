class QuestionsController < ApplicationController
  def index
    @form = Form.find(params[:form_id])
    @questions = @form.questions
  end

  def new
    @form = Form.find params[:form_id]
    @question = @form.questions.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    question = Form.find(params[:form_id]).questions.new(question_params)
    if question.save
      flash[:notice] = ' A new question has been created'
      redirect_to form_path(params[:form_id])
    else
      flash[:notice] = 'there something wrong when creating new question'
      redirect_to new_question_path
    end
  end

  def update
    question = Question.find(params[:id])
    if question.update(question_params)
      flash[:notice] = 'Question has been updated'
      redirect_to form_path(params[:form_id])
    end
  end

  def destroy
    question = Question.find(params[:id])
    if question.destroy
      flash[:notice] = 'Question has been deleted'
      redirect_to form_path(params[:form_id])
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:question_text, :question_type, :form_id)
  end
end
