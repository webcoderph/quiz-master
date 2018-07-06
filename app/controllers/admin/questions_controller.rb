module Admin
  class QuestionsController < ApplicationController
    before_action :set_question, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :check_access
    respond_to :html

    def index
      if params[:view].present?
        @questions = Question.paginate(:page => params[:page], :per_page => 5)
        render 'all'
      else
        @questions = Question.all
      end
    end
    
    def new
      @question = Question.new
    end
    
    def create
      @question = Question.new(question_params)
      
      if @question.save
        flash[:success] = "You have successfully added a new question!"
        redirect_to root_path
      else
        render :new
      end
    end
    
    def show; end
    
    def edit; end
    
    def update
      if @question.update(question_params)
        flash[:success] = "Your question was successfully updated!"
        redirect_to [:admin, @question]
      else
        render :edit
      end          
    end
    
    def destroy
      @question.destroy
      flash[:success] = "You have successfully deleted a question!"
      redirect_to root_path
    end    
    
    private
    
    def set_question
      @question = Question.find(params[:id])
    end
    
    def question_params
      params.require(:question).permit(:title, :answer, :active)
    end
    
    def check_access
      redirect_to questions_path unless current_user.admin
    end
  end
end
