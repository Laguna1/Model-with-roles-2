class VisitsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @visits = Visit.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
