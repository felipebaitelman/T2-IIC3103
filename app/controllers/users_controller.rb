class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  require 'json'

  # GET /users
  def index
    @users = User.all
    render json: {:usuarios => @users, :total => @users.count}
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create

    # Se ingresa un id
    if params[:id]
      render json: {error: 'No se puede crear usuario con id'}, status: 400
    else
      @user = User.new(user_params)
      if @user.save
        render json: @user, :status => 201
      else
        render json: {error: 'La creación ha fallado'}, status: 500
      end
    end
  end

  # PATCH/PUT /users/1
  def update

    # Se intenta modificar más de un atributo
    if user_params.count > 1
      render json: {error: 'La modificación ha fallado'}, status: 500
    # Se intenta modificar solo un atributo
    else
      new_params = user_params
      if !new_params[:id]
        new_params[:id] = @user.id
      end
      # Se ingresa un id para modificar
      if  new_params[:id] != @user.id
        render json: {error: 'id no es modificable'}, status: 400
      # Se ingresa un parametro distinto al id
      else
        if @user.update(new_params)
          render json: @user
        else
          render json: {error: 'La modificación ha fallado'}, status: 500
        end
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end


  private


    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:id, :usuario, :nombre, :apellido, :twitter)
    end


end
