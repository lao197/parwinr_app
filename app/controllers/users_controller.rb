class UsersController < ApplicationController
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy

  def new()
    @title = "Sign up"
    @user = User.new
  end
  
  def index()
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end

  def show()
    @user = User.find(params[:id])
#    @microposts = @user.microposts.paginate(:page => params[:page])
    @title = @user.firstName
  end

  def following()
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end

  def followers()
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end

  def create()
    @user = User.new(params[:user])
    @user.attributes = { :points => 100, :level => 0 }
    
    if @user.save
      sign_in(@user)
      flash[:success] = "Welcome to ParWinr!"
      redirect_to(root_path)
    else
      @title = "Sign up"
      @user.password = ""
      @user.password_confirmation = ""
      render('new')
    end
  end
  
  def edit()
    @title = "Edit user"
  end
  
  def update()
    @user = User.find(params[:id])
    if !@user.nil?
      if @user.update_attributes(params[:user])
        flash[:success] = "Profile updated."
        redirect_to(@user)
      else
        @title = "Edit user"
        render('edit')
      end
    end
  end
  
  def destroy()
    user = User.find(params[:id])
    if !user.isAdmin() && user.destroy()
      flash[:success] = "User removed!"
    else
      flash[:error] = "Cannot remove the user, especially if he/she is an admin"
    end
    redirect_to(users_path)
  end

  private

    def correct_user()
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

end
