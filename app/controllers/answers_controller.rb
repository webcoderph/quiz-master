class AnswersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @question = Question.find(params[:question_id])
    
    @answer = Answer.new(answer_params)
    
    if Answers::Check.new(@answer, @question, current_user).run!
      flash[:sucess] = "Thank You! Next Question Please."
      redirect_to questions_path
    else
      flash[:danger] = "Oops, something went wrong. Please try again later."  
      redirect_to @question 
    end
  end
  
  private
  
  def answer_params
    params.require(:answer).permit(:answer)
  end
end
