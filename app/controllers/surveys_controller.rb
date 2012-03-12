class SurveysController < ApplicationController
  
  def index
    @surveys = Survey.all
  end

  def show
    if(curren_user == Survey.find(params[:id]).user_id)
      @survey = Survey.find(params[:id])
    end
  end

  def create
  end

  def destroy
  end

  def new
  end
end
