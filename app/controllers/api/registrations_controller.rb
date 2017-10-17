class Api::RegistrationsController < ApplicationController

	def create
    @user = User.new(user_params)
    if @user.save
      render json: {"notice" => "Registrado com sucesso!"}, status: :ok
    else
      render json: {"error" => "Verifique os parâmetros!"}, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :username, :password, :password_confirmation)
  end
end
