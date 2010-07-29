class UserSessionsController < ApplicationController
  skip_before_filter :login_required, :except => :destroy

  def new
    @user_session = UserSession.new
  end
  
  def create  
    @user_session = UserSession.new(params[:user_session])  
    if @user_session.save  
      flash[:notice] = "Successfully logged in."  
      redirect_back_or_default households_url  
    else  
      render :action => 'new'  
    end  
  end
  
  def destroy  
    @user_session = UserSession.find  
    @user_session.destroy  
    flash[:notice] = "Successfully logged out."  
    redirect_to login_url  
  end

end
