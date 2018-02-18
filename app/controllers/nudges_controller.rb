class NudgesController < ApplicationController
  def index
    @nudges = Nudge.all
  end

  def new
    @nudge = Nudge.new
  end

  def create
    @nudge = Nudge.create(nudge_params)
    redirect_to nudges_path
  end

  def edit
    @nudge = Nudge.find(nudge_params[:id])
  end

  def update
    @nudge = Nudge.find(nudge_params[:id])
    @nudge.update(nudge_params)
  end

  def destroy
    @nudge = Nudge.find(params[:id])
    @nudge.destroy
    redirect_to nudges_path, notice: 'Nudge deleted'
  end

  def nudge
    NudgeJob.perform_later(params[:nudge_id])
    redirect_to nudges_path, notice: 'Nudged.'
  end

  private

  def nudge_params
    params.require(:nudge).permit(:id, :body, :title)
  end
end
