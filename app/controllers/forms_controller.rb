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

  def update
  end

  def destroy
    form = Form.find(params[:id])
    if form.delete
      flash[:notice] = "#{form.title} has been deleted"
      redirect_to forms_url
    else
      flash[:notice] = "#{form.title} can't be deleted"
      redirect_to(form)
    end
  end

  private

  def form_params
    params.require(:form).permit(:title, :description)
  end
end