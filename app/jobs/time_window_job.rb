class TimeWindowJob < ApplicationJob
  attr_reader :time_window

  def perform(time_window_id)
    @time_window = TimeWindow.find(time_window_id)

    time_window.nudges.each do |nudge|
      NudgeJob.set(wait_until: random_time_in_time_window).perform_later(nudge.id)
    end
  end

  def random_time_in_time_window
    (Date.today + random_hour_in_range + rand(0..60).minutes).to_datetime
  end

  def random_hour_in_range
    rand(time_window.start_time.hour..time_window.end_time.hour).hour
  end
end
