class TimeWindowsController < ApplicationController
  def index
    @time_windows = TimeWindow.all
  end

  def new
    @time_window = TimeWindow.new
  end

  def create
    TimewWindow.create(time_window_params)
  end

  private

  def time_window_params
    params.require(:time_window).permit(:id, :name, :start_time, :end_time)
  end
end
