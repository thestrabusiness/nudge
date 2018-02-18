class Nudge < ApplicationRecord
  validates :title, :body, :time_window_id, presence: true
end
