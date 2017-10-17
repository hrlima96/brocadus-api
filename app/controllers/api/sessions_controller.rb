class Api::SessionsController < ApplicationController
  before_filter :validate_access_token, only: :destroy

  def create
    if @user = User.find_by_username(user_params[:username]) and @user.authenticate(user_params[:password])
      response.headers["Access-Token"] = @user.new_access_token
      render json: {"notice" => "Logado com sucesso!"}, status: :ok
    else
      render json: {"error" => "Username ou senha inválidos!"}, status: :unauthorized
    end
  end

  def destroy
    set_user
    @user.reset_access_token
    render json: {"notice" => "Deslogado com sucesso!"}
  end

  private

  def set_user
    @user = User.find_by_access_token(request.headers['Access-Token'])
  end

  def user_params
    params.permit(:username, :password)
  end
end
