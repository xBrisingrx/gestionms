class UserMailer < ApplicationMailer
  default from: "sistemas@maurosampaoli.com.ar"
  layout 'mailer'

  def ticket_varios
    @ticket = params[:ticket]
    @rol = params[:rol]

    if params[:email].nil?
          mail(to: "soporte@maurosampaoli.com.ar",
               subject: "[Ticket Nº " + @ticket.id.to_s + "] " + @tickt.title) do |format|
               format.html
      end
    else
      mail(to: "soporte@maurosampaoli.com.ar," + params[:email]*",",
           subject: "[Ticket Nº " + @ticket.id.to_s + "] " + @tickt.title) do |format|
           format.html
      end
    end
  end #metodo

  def ticket_soporte_tecnico
    @ticket = params[:ticket]
    mail(to: "soporte@maurosampaoli.com.ar",
    		 subject: "[Ticket Nº " + @ticket.id.to_s + "] " + @tickt.title) do |format|
    		 format.html
    end
  end

  def ticket_answer
    @answer = params[:answer]
    @ticket = params[:ticket]

    if params[:email].nil?
      mail(to: "soporte@maurosampaoli.com.ar",
           subject: "[Respuesta ticket Nº " + @ticket.id.to_s + "] " + @tickt.title) do |format|
           format.html
      end

    else

      mail(to: "soporte@maurosampaoli.com.ar," + params[:email]*",",
           subject: "[Respuesta ticket Nº " + @ticket.id.to_s + "] " + @tickt.title) do |format|
           format.html
      end
    end

  end

end
