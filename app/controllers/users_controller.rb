class UsersController < ApplicationController
  def new
  end

  def create
    @newUser = User.new(user_params)
    if @newUser.save
      session[:user_id] = @newUser.id
      puts @newUser.inspect
      redirect_to '/'
    else
      redirect_to '/signup'
    end

  end

  def authenticate_with_credentials(params[:email], params[:password])
  
  end

  def user_params
    params.require(:user).permit(
      :name, 
      :email, 
      :password, 
      :password_confirmation
    )

  end   
end
