class UsersController < ApplicationController
  before_action :check_admin, only: [:index]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_current_user, only: [:show]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

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
      params.require(:user).permit(:admin)
    end

    def check_admin
      redirect_to root_path if !current_user.admin
    end

    def check_current_user
      if !current_user.admin
        redirect_to user_path(current_user) if current_user != @user
      end
    end
end
