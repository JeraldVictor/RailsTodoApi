class UsersController < ApplicationController
  def index
    @user = User.all().as_json(:include => :todos)
    render :json => { error: false, users: @user }
  end

  def show
    @user = User.find(params[:id])
    render :json => { error: false, user: @user }
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render :json => { error: false, user: @user ,message: "User Created"}
    else
      render :json => { error:true, message: @user.errors.as_json }
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render :json => { error: false, user: @user, message:"User updated" }
    else
      render :json => { error:true, message: @user.errors.as_json }
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      render :json => { error: false, user: @user, message:"User Deleted" }
    else
      render :json => { error:true, message: @user.errors.as_json }
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email)
  end
end
