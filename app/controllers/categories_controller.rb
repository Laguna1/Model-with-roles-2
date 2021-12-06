# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /categories
  def index
    @categories = Category.all
  end

  # GET /categories/1
  def show
    @user = User.new
    @user.category_id = @category.id
  end

  # GET /categories/new
  def new; end

  # GET /categories/1/edit
  def edit; end

  # POST /categories
  def create
    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:speciality)
  end
end
