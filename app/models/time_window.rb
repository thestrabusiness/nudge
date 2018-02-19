class TimeWindow < ApplicationRecord
  #associations
  has_many :nudges

  #validations
  validates :name, :start_time, :end_time, presence: true
  validate :start_time_before_end_time

  #callbacks
  after_create :schedule_time_window_job

  def start_time_today
    (Date.today + start_time.hour.hours + start_time.min.minutes).to_datetime
  end

  def start_time_tomorrow
    (Date.tomorrow + start_time.hour.hours + start_time.min.minutes).to_datetime
  end

  def end_time_today
    (Date.today + end_time.hour.hours + end_time.min.minutes).to_datetime
  end

  def end_time_tomorrow
    (Date.tomorrow + end_time.hour.hours + end_time.min.minutes).to_datetime
  end

  def in_time_window?
    Time.current >= start_time_today && Time.current <= end_time_today
  end

  private

  def start_time_before_end_time
    return unless start_time && end_time

    if end_time <= start_time
      errors.add :end_time, 'End time must be after start time'
    end
  end

  def schedule_time_window_job
    TimeWindowJob.set(wait_until: start_time_to_schedule).perform_later(self.id)
  end

  def start_time_to_schedule
    if in_time_window?
      Time.current
    else
      start_time_tomorrow
    end
  end
end
