# frozen_string_literal: true

class RolesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /roles
  def index
    @roles = Role.all
  end

  # GET /roles/1
  def show
    if @role.users.empty?
      @associated_user = 'None'
    else
      @associated_users = @role.users
    end
  end

  # GET /roles/new
  def new; end

  # GET /roles/1/edit
  def edit; end

  # POST /roles
  def create
    if @role.save
      redirect_to @role, notice: 'Role was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /roles/1
  def update
    if @role.update(role_params)
      redirect_to @role, notice: 'Role was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /roles/1
  def destroy
    @role.destroy
    redirect_to roles_url, notice: 'Role was successfully destroyed.'
  end

  private

  # Only allow a list of trusted parameters through.
  def role_params
    params.require(:role).permit(:name, :description)
  end
end
