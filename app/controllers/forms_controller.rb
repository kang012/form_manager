class FormsController < ApplicationController
  def index
    @forms = current_user.forms
  end

  def new
    @form = Form.new
  end

  def create
    form = current_user.forms.new(form_params)
    if form.save
      flash[:notice] = 'A new form has been successfully created'
      redirect_to user_forms_path
    else
      flash[:notice] = 'Can\'t not creating new form'
    end
  end

  def show
    @form = Form.find(params[:id])
  end

  def result
    @form = Form.find(params[:form_id])
  end

  def edit
    @form = Form.find(params[:id])
  end

  def update
    form = Form.find(params[:id])
    form.update(form_params)
    flash[:notice] = "#{form.title} has been updated"
    redirect_to user_form_path(current_user, params[:id])
  end

  def destroy
    form = Form.find(params[:id])
    form.delete
    flash[:notice] = "#{form.title} has been deleted"
    redirect_to user_form_path(current_user, params[:id])
  end

  private

  def form_params
    params.require(:form).permit(:title, :description)
  end
end
