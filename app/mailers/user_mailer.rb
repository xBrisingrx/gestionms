class UserMailer < ApplicationMailer
  default from: "sistemas@maurosampaoli.com.ar"
  layout 'mailer'

  def welcome_email
    # @ticket = params[:ticket]
    @url  = 'http://example.com/login'
    mail(to: 'sistemas@maurosampaoli.com.ar', subject: '@ticket.title')
  end

end
