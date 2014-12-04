class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def login
    @facebook_user = User.koala(request.env['omniauth.auth']['credentials'])
    @full_name = @facebook_user['name'].split(/ /)

    @user = User.new
    @user[:id] = @facebook_user['id']
    @user[:name] = @full_name[0]
    @user[:surname] = @full_name[1]
    @user[:avatar] = @facebook_user['picture']['data']['url'].to_s

    session[:id] = @user[:id]
    session[:name] = @user[:name]
    session[:surname] = @user[:surname]

    unless User.exists?(@user[:id])
      @user.save
    end

    redirect_to @user, notice: 'Bienvenue ' + @facebook_user['name']
  end

  # GET /logout
  def logout
    reset_session
    redirect_to root_path, notice: 'Vous avez bien été déconnecté. À bientôt !'
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
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
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :surname, :phone, :location)
    end
end
