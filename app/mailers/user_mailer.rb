class UserMailer < ApplicationMailer
  default from: "sistemas@maurosampaoli.com.ar"
  layout 'mailer'

  def ticket_varios
    @ticket = params[:ticket]
    @rol = params[:rol]

    if params[:email].nil?
          mail(to: "sistemas@maurosampaoli.com.ar",
               subject: @ticket.title) do |format|
               format.html
      end
    else
      mail(to: "sistemas@maurosampaoli.com.ar," + params[:email]*",",
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

    if params[:email].nil?
      mail(to: "sistemas@maurosampaoli.com.ar",
           subject: "Respuesta al ticket Nº " + @ticket.id.to_s) do |format|
           format.html
      end

    else

      mail(to: "sistemas@maurosampaoli.com.ar," + params[:email]*",",
           subject: "Respuesta al ticket Nº " + @ticket.id.to_s) do |format|
           format.html
      end
    end

  end

end
