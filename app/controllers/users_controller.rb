class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if session[:id]
      redirect_to laundromats_path
    end
  end

  # GET /parameters
  def parameters
    flash.now[:notice] = "Les fonctionnalités de cette page seront bientôt disponibles !"
  end

  def callback
    facebook_user = User.koala(request.env['omniauth.auth']['credentials'])
    full_name_array = facebook_user['name'].split(/ /)
    full_name = facebook_user['name']
    name = full_name_array[0]
    full_name_array.shift
    surname = full_name_array.join(' ')

    if User.exists?(:fbid => facebook_user['id'])
      user = User.find_by_fbid(facebook_user['id'])
    else
      user = User.new
      user[:fbid] = facebook_user['id']
      user[:name] = name
      user[:surname] = surname
      user[:avatar] = facebook_user['picture']['data']['url'].to_s
      user.save
    end

    puts YAML::dump(facebook_user)

    session[:id] = user[:id]
    session[:fbid] = user[:fbid]
    session[:name] = user[:name]
    session[:surname] = user[:surname]

    redirect_to laundromats_path, notice: 'Bienvenue ' + session[:name]
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

  # GET /profile
  def profile
    if session[:id]
      @user = User.find(session[:id])
    else
      redirect_to root_path, notice: 'Vous n\'êtes pas connecté'
    end
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
        format.html { redirect_to @user, notice: 'L\'utilisateur a été créé avec succès' }
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
        format.html { redirect_to @user, notice: 'L\'utilisateur a été modifié avec succès' }
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
      format.html { redirect_to users_url, notice: 'L\'utilisateur a été supprimé avec succès' }
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
