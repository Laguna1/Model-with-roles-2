# frozen_string_literal: true

class VisitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_visit, only: %i[show edit update destroy]
  load_and_authorize_resource

  def index
    @visits = Visit.all
    # @created_visits = User.created_visits
    # @requested_visits = User.requested_visits
  end

  def show
    @visit = Visit.find(params[:id])
    @pat = @visit.pat
    @doc = @visit.doc
  end

  def new
    @visit = Visit.new
  end

  def create
    @visit = current_user.created_visits.build(visit_params)
    if @visit.save
      redirect_to @visit, notice: 'Your visit was succesfully created'
    else
      render :new
    end
  end

  def edit; end

  # It needs to add here to close_visit? after the doctor`s appointment
  def update
    if @visit.update(visit_params)
      redirect_to @visit, notice: 'Visit was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /visits/1
  def destroy
    @visit.destroy
    redirect_to visits_url, notice: 'Visit was successfully destroyed.'
  end

  private

  def set_visit
    @visit = Visit.find(params[:id])
  end

  def visit_params
    params.require(:visit).permit(:date, :note, :pat_id, :doc_id)
  end
end
