class Nudge < ApplicationRecord
  validates :title, :body, presence: true
end
