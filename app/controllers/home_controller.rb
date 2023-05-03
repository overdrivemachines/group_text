class HomeController < ApplicationController
  def index; end

  def send_message
    recipients = params[:recipients]
    msg = params[:message]
    # Find your Account SID and Auth Token at twilio.com/console
    # and set the environment variables. See http://twil.io/secure
    account_sid = Rails.application.credentials.dig(:twilio, :account_sid)
    auth_token = Rails.application.credentials.dig(:twilio, :auth_token)
    phone = Rails.application.credentials.dig(:twilio, :phone)
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = ""
    @display_message = "Message Sent"
    begin
      message = @client.messages.create(body: msg, from: phone, to: recipients)
    rescue StandardError => e
      # https://www.rubydoc.info/gems/twilio-ruby/Twilio/REST/RestError
      # @display_message = e.error_message
      @display_message = e.message
      # @display_message = e.more_info
    else
      @display_message = "#{message.body} sent to #{message.to}"
    end
  end
end
