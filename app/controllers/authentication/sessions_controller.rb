class Authentication::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: user_params[:email])
    if @user&.authenticate(user_params[:password])
      session[:user_id] = @user.id
      render json: {
        status: :created,
        logged_in: true,
        user: @user
      }
    else
      render json: {
        status: 401,
        message: 'Invalid email or password'
      }
    end
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: {
      status: 200,
      logged_out: true
    }
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
