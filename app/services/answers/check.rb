module Answers
  class Check
    attr_accessor :user_answer, :question, :correct, :user
    
    def initialize(user_answer, question, user)
      @user        = user
      @user_answer = user_answer
      @question    = question
      @correct     = false
    end
    
    def run!
      return false if @user_answer.nil? || @question.nil?
      process!
      save!
    end
    
    private
    
    def save!
      @user_answer.user     = @user
      @user_answer.question = @question
      @user_answer.correct  = @correct
      @user_answer.save!
    end
    
    def process!
      if @question.answer.to_i > 0 and @user_answer.answer.to_i < 1
        convert = @question.answer.to_i
        correct_answer = convert.to_words
        
        if correct_answer == @user_answer.answer
          @correct = true
        end 
      elsif @question.answer == @user_answer.answer
        @correct = true
      end  
    end
    
    
  end
end