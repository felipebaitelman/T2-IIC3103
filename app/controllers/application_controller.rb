class ApplicationController < ActionController::API

  # Idea de https://blog.rebased.pl/2016/11/07/api-error-handling.html

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def render_not_found_response(exception)
    render json: { error: "Usuario no encontrado"}, status: :not_found
  end

end
