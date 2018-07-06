module Admin
  class ScoresController < ApplicationController
    before_action :authenticate_user!
    before_action :check_access
    respond_to :html
    
    def index
      @users = User.not_admin.paginate(:page => params[:page], :per_page => 10)
    end
    
    private
    
    def check_access
      redirect_to questions_path unless current_user.admin
    end
  end
end