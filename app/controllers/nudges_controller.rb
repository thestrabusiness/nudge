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
    @nudge = Nudge.find(nudge_id)
    @nudge.destroy
  end

  def nudge
    @nudge = Nudge.find(params[:nudge_id])
    TwilioClient.send_message(to: TO_PHONE, from: TEST_PHONE, body: @nudge.body)
    redirect_to nudges_path, notice: 'Nudged.'
  end

  private

  def nudge_params
    params.require(:nudge).permit(:id, :body, :title)
  end
end
