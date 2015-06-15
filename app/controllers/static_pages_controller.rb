class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:finder]
  def home
  	@title = "Home of Scholars"
    gon.users = User.all
  end

  def help
  	@title = "Help"
    @users = User.all
  end

  def about
  	@title = "About"
    gon.user = User.first
  end

  def contact
  	@title = "Contact"
    @users = User.all
    gon.users = User.all
    @user = User.new
  end
  def finder
    @title = "Finder"
    gon.users = User.all
    gon.current_user = current_user
    @current_user = current_user
    if params[:search]
      @users = User.search(params[:search]).paginate(page: params[:page],:per_page => 10)
      @length = @users.length
    else
      @users = User.paginate(page: params[:page],:per_page => 10)
    end
  end

  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
