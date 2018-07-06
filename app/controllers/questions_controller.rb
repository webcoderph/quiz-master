class QuestionsController < ApplicationController
  before_action :set_question, only: [:show]
  before_action :authenticate_user!
  
  def index
    @questions = Question.active.paginate(:page => params[:page], :per_page => 5)
  end
  
  def show; end
  
  private
  
  def set_question
    @question = Question.find(params[:id])
  end
end
