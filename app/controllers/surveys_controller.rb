class SurveysController < ApplicationController
  
  def index
    @surveys = Survey.all
  end

  def show
    if(current_user == Survey.find(params[:id]).user_id)
      @survey = Survey.find(params[:id])
    end
  end
  
  def edit
    @survey = Survey.find(params[:id])
  end

  def create
    @survey = Survey.new(params[:survey])

    if @survey.save
      redirect_to(surveys_path, :notice => t('notice.survey.create_succesfull'))
    else
      render :action => 'new'
    end
  end

  def update
    @survey = Survey.find(params[:id])
    @survey.attributes = params[:survey]

    if @survey.save
      redirect_to(surveys_path, :notice => t('notice.survey.update_succesfull'))
    else
      render :action => 'edit'
    end
  end

  def destroy
  end

  def new
    @survey = Survey.new()
  end
end
