class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.by_age
  end

  def show
  end

  def new
    @user = User.new
    @user.address = Address.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was created'
    else
      render :new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was updated'
    else
      render :edit
  end

  def destroy
    @user.destroy
    redirect_to :root
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :gender,
    address_attributes: [:street, :city, :state, :zip]
    )

end
