class AnswersController < ApplicationController
  def index
    @answers = Answer.all
  end

  def show
    @answer = Answer.find(params[:id])
  end
  
  def new
    @answer = Answer.new()
  end

  def create
    @answerer = Answer.new(params[:answar])
    
    if @answer.save
      redirect_to(answers_path, :notice => t('notice.answer.create_successful'))
    else
      render :action => 'new'
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.attributes = params[:answar]

    if @answer.save
      redirect_to(answers_path, :notice => t('notice.answar.update_successful'))
    else
      render :action => 'edit'
    end
  end

  def destroy
  end

end
