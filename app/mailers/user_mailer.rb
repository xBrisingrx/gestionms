class UserMailer < ApplicationMailer
  default from: "sistemas@maurosampaoli.com.ar"
  layout 'mailer'

  def ticket_varios
    @ticket = params[:ticket]
    @rol = params[:rol]
    @user_email = params[:user_email]

    if @rol == 'Cliente'
      mail(to: @user_email,
           cc: "soporte@maurosampaoli.com.ar",
           subject: @ticket.title) do |format|
           format.html
      end

      # mail(to: @user_email,
      #      subject: @ticket.title) do |format|
      #      format.html
      # end

    else 
      mail(to: "soporte@maurosampaoli.com.ar",
           subject: @ticket.title) do |format|
           format.html
      end
    end
  end #metodo

  def ticket_soporte_tecnico
    @ticket = params[:ticket]
    mail(to: "soporte@maurosampaoli.com.ar",
    		 subject: @ticket.title) do |format|
    		 format.html
    end
  end

  def ticket_answer
    @answer = params[:answer]
    @ticket = params[:ticket]

    mail(to: "soporte@maurosampaoli.com.ar",
    		 subject: "Respuesta al ticket Nº " + @ticket.id.to_s) do |format|
    		 format.html
    end
  end


end
