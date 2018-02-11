class NudgeJob < ApplicationJob
  def perform(nudge_id)
    nudge = Nudge.find(nudge_id)
    TwilioClient.send_message(to: TO_PHONE, from: TEST_PHONE, body: nudge.body)
  end
end
