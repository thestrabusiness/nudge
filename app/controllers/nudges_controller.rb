class NudgesController < ApplicationController
  def index
    @nudges = Nudge.all
  end

  def new
    @nudge = Nudge.new
  end

  def create
    @nudge = Nudge.create(nudge_params)
    redirect_to :index
  end

  def edit
    @nudge = Nudge.find(nudge_params[:id])
  end

  def update
    @nudge = Nudge.find(nudge_params[:id])
    @nudge.update
  end

  def destroy
    @nudge = Nudge.find(nudge_params[:id])
    @nudge.destroy
  end

  private

  def nudge_params
    params.require(:nudge).permit(:id, :body, :title)
  end
end
