class UsersController < ApplicationController
  before_action :check_sign_in, except: [:products, :show]
  before_action :check_admin, except: [:products, :show]
  before_action :set_user, only: [:products, :show, :edit, :update, :destroy]

  def products
    @products = @user.products
  end

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

    def check_sign_in
      redirect_to root_path if !user_signed_in?
    end

    def check_admin
      redirect_to root_path if !current_user.admin
    end
end
