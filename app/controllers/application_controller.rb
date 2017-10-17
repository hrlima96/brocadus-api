class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def validate_access_token
    token = request.headers['Access-token']
    if token == nil
      render json:{"error" => "É preciso um token de acesso!"}, status: :unauthorized
      return
    end

    user = User.find_by_access_token(token)
    render json: {"error" => "O token enviado não é válido!"}, status: :unauthorized if user == nil
  end
end
