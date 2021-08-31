require 'twilio-ruby'

class TwilioClient
  def initialize(user, message)
    @user = user
    @message = message
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send
    @client.messages.create(
      to: '+33769055438',
      from: twilio_number,
      body: @message
    )
  end

  private

  def account_sid
    ENV['TWILIO_ACCOUNT_SID']
  end

  def auth_token
    ENV['TWILIO_AUTH_TOKEN']
  end

  def twilio_number
    ENV['TWILIO_NUMBER']
  end
end
