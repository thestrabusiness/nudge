class Nudge < ApplicationRecord
  #associations
  belongs_to :time_window

  #validations
  validates :title, :body, :time_window_id, presence: true
end
