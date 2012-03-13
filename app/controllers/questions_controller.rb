class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end
  
  def new
    @question = Question.new()
  end

  def create
    @question = Question.new(params[:question])

    if @question.issues.size >= 10 && @question.save
      redirect_to(questions_path, :notice => t('notice.question.create_succesful'))
    else
      render :action => 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.attributes = params[:question]

    if @question.save
      redirect_to(questions_path, :notice => t('notice.question.update_successful'))
    else
      render :action => 'edit'
     end
  end

  def destroy
  end
end
