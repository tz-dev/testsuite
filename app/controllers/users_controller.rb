class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if current_user && current_user.role == "admin"
      @nav = "users"
      if !params[:sort_by]
        @users = User.all.sort_by { |user| user.id }
      end
      if params[:sort_by] == "name"
        @users = User.all.sort_by { |user| user.name }
      end
      if params[:sort_by] == "email"
        @users = User.all.sort_by { |user| user.email }
      end
      if params[:sort_by] == "role"
        @users = User.all.sort_by { |user| user.role }
      end
      if params[:sort_by] == "date"
        @users = User.all.sort_by { |user| user.created_at }
      end
      if params[:sort_by] == "name_rev"
        @users = User.all.sort_by { |user| user.name }.reverse!
      end
      if params[:sort_by] == "email_rev"
        @users = User.all.sort_by { |user| user.email }.reverse!
      end
      if params[:sort_by] == "role_rev"
        @users = User.all.sort_by { |user| user.role }.reverse!
      end
      if params[:sort_by] == "date_rev"
        @users = User.all.sort_by { |user| user.created_at }.reverse!
      end
    else
      redirect_to root_url
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if current_user && (current_user.id == @user.id || current_user.role == "admin")
      @nav = "users"
    else
      redirect_to root_url
    end
    @results = Result.all.where(user_id: current_user.id)
  end

  # GET /users/new
  def new
    if current_user == nil || current_user.role == "admin"
      @user = User.new
      @nav = "users"
    else
      redirect_to root_url
    end
  end

  # GET /users/1/edit
  def edit
    if (current_user.id == @user.id || current_user.role == "admin")
      @nav = "users"
    else
      redirect_to root_url
    end
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
    if current_user
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_url
    end
  end

  # DELETE /users/1 - last admin cannot destroy himself
  # DELETE /users/1.json
  def destroy
    if current_user && current_user.role == "admin"

      user_results = Result.where(user_id: params[:user_id])
      user_results.each do |result|
        result.destroy
      end

      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :role, :password_confirmation)
    end
end
