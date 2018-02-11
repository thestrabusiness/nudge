class TwilioClient
  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new(TWILIO_SID, TWILIO_TOKEN).api.account
  end

  def self.send_message(to:, from:, body:)
    new.send_message(to: to, from: from, body: body)
  end

  def send_message(to:, from:, body:)
    @client.messages.create(to: to, from: from, body: body)
  end
end
