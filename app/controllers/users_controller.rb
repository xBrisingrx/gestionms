class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :disable]

  # GET /users
  # GET /users.json
  def index
    @users = User.where(active: true).order(username: :asc)
    @title = 'Usuarios'
    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @clients = Client.all
    respond_to do |format|
      format.js
    end
  end

  # GET /users/1/edit
  def edit
    @clients = Client.all
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    # Buscamos a la persona para actualizarle el tipo persona a referente
    @person = Person.where(id: params[:person_id])

    respond_to do |format|
      if @user.save!
        @person.update( person_type_id: 2 )
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        format.js
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render json: { status: true }, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    respond_to do |format|
      if @user.update(active: false)
        render json: { status: 'success' }
      else
        format.html { redirect_to users_url, notice: 'No se pudo dar de baja el usuario.' }
      end
    end
  end

  def disable
    if @user.update(active: false)
      render json: { status: 'success' }
    else
      render json: { status: 'error' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :person_id, :rol_id)
    end
end
