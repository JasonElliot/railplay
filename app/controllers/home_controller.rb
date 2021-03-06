class HomeController < ApplicationController

  def index
    @user = User.all
  end
  def new
    @user= User.new
  end
  def create
    @user = User.new(require_params)
    if @user.save
      flash[:success]="saved"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def require_params
    params.require(:user).permit(:name,:phno)
  end
end
