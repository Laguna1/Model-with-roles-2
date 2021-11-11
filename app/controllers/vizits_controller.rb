class VizitsController < ApplicationController
  before_action :set_vizit, only: [:show, :edit, :update, :destroy]

  # GET /vizits
  def index
    @vizits = Vizit.all
  end

  # GET /vizits/1
  def show
  end

  # GET /vizits/new
  def new
    @vizit = Vizit.new
  end

  # GET /vizits/1/edit
  def edit
  end

  # POST /vizits
  def create
    @vizit = Vizit.new(vizit_params)

    if @vizit.save
      redirect_to @vizit, notice: 'Vizit was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /vizits/1
  def update
    if @vizit.update(vizit_params)
      redirect_to @vizit, notice: 'Vizit was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /vizits/1
  def destroy
    @vizit.destroy
    redirect_to vizits_url, notice: 'Vizit was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vizit
      @vizit = Vizit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vizit_params
      params.require(:vizit).permit(:date, :notes, :user_id)
    end
end
