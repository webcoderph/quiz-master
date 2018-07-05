module Admin
  class QuestionsController < ApplicationController
    before_action :set_question, only: [:show, :edit, :update, :destroy]
    respond_to :html

    def index
      @questions = Question.all
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
      if @question.update(post_params)
        flash[:success] = "Your question was successfully updated!"
        redirect_to @question
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
      params.require(:question).permit(:title, :answer)
    end
  end
end
