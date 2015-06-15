class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy, :show]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user,   only: [:destroy, :index]
  before_action :new_user, only: :new

  def index
    #@users = User.paginate(page: params[:page],:per_page => 20)
    #@usersall = User.all
    @title = "All Users"
    if params[:search]
      @users = User.search(params[:search]).paginate(page: params[:page], :per_page => 10)
      @length = @users.length
    else
      @users = User.paginate(page: params[:page], :per_page => 10)
    end
  end

  def new
  	@title = "Sign Up Page"
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  	@title = "User: #{@user.name}"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @title = "Edit Profile"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end



  # Destroy delete user
    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User deleted."
      redirect_to users_url
    end

    # Confirms an admin user
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def new_user
      redirect_to(root_url) unless !logged_in?
    end


  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation, :lat, :long)
  	end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        flash[:danger] = "You cannot edit someone else's profile."
        redirect_to @user 
      end
    end
end
