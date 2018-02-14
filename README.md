# Nudge

### Running locally

1. Clone app
2. `cd nudge`
3. `bundle install`
4. `rails db:setup`
5. `bundle exec sidekiq`
6. `rails s`

### Requirements

* Ruby 2.5.0
* Redis
* Postgres
* A twilio dev account

### Twilio Dev Account

You'll need a Twilio developer account to obtain a phone number and API credentials.
 Make a `.env` file in the app's root with the following content:
 
 ```
TWILIO_SID=<Your twilio user SID>
TWILIO_TOKEN=<Your twilio auth token>
TEST_PHONE=<The phone number you get from twilio>
TO_PHONE=<A verified phone number on your dev account to send test messages to>
 ```

