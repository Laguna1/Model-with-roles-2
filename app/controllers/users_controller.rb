# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    @joined_on = @user.created_at.to_formatted_s(:short)

    @last_login = if @user.current_sign_in_at
                    @user.current_sign_in_at.to_formatted_s(:short)
                  else
                    'never'
                  end
  end

  # GET /users/new
  def new; end

  # GET /users/1/edit
  def edit; end

  # POST /users
  def create
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end

    if successfully_updated
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    # if doctor?
    #   params.require(:user).permit(:fullname, :role_id, :category_id, :mobile_no, :address, :email, :password, :password_confirmation)
    # else
    params.require(:user).permit(:fullname, :role_id, :mobile_no, :address, :email, :password, :password_confirmation,
                                 :category_id)
    # end
  end

  def needs_password?(_user, params)
    params[:password].present?
  end
end
