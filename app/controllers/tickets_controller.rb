class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy, :close_ticket, :assign_person]
  # Es lo mismo que escribir
  # self.before_action(:set_person, {:only => [:show, :edit, :update, :destroy]})
  # es lo mismo, porque por un conjunto de reglas de ruby , tenés que el último
  # parámetro que se le manda a un método, se asume que es un hash, y por eso podés no poner los {}
  # y como es ruby, se pueden omitir los (), y como el => se puede reemplazar por : cuando la key del hash es un simbolo...

  def index
    @title = 'Tickets'
    @user_rol = current_user.rol.name

    @people = Person.where( client_id: 20 )
    @table_process = { title: 'Tickets en proceso', id: 'process_tickets_table' }
    @table_closed = { title: 'Tickets finalizados', id: 'closed_tickets_table' }

    respond_to do |format|
      if current_user.rol.name == 'Administrador'
        format.html
        format.json { render json: Ticket.group(:ticket_status_id).count }
      else 
        format.html { render 'client_view' }
        format.json { render json: Ticket.group(:ticket_status_id).count }
      end
    end
  end

  def get_tickets 
    if current_user.rol.name == 'Administrador'
      if params[:ticket_status_id] == '3'
        @open_tickets = Ticket.where(active: true, ticket_status_id: params[:ticket_status_id] )
      else
        @open_tickets = Ticket.where(active: true).where.not( ticket_status_id: 3 )
      end
    else
      if params[:ticket_status_id] == '3'
        @open_tickets = Ticket.where(active: true, ticket_status_id: 3, client_id: current_user.person.client_id )
      else 
        @open_tickets = Ticket.where(active: true, client_id: current_user.person.client_id ).where.not( ticket_status_id: 3 )
      end
      
    end
    respond_to do |format|
      if current_user.rol.name == 'Administrador'
        format.json { render :index }
      else
        format.json { render :tickets_client }
      end
      
    end
  end

  def count_tickets
    if current_user.rol.name == 'Administrador'
      @count_tickets = Ticket.group(:ticket_status_id).count
    else
      @count_tickets = Ticket.where(client_id: current_user.person.client_id).group(:ticket_status_id).count
    end

    respond_to do |format|
      format.json { render :json => { open: @count_tickets[1] , process: @count_tickets[2], closed: @count_tickets[3]  } }
    end
  end

  def get_emails ticket
    if ticket.user.rol == 'Administrador' and ticket.report
      @emails = Person.select( :email ).where( client_id: ticket.client.id, person_type_id: 2 ) 
    else
      @emails = Person.select( :email ).where( client_id: ticket.client.id, person_type_id: 2 ) 
    end
  end

  def show
    @title = 'Ver ticket'
    @ticket_create = Ticket.find(params[:id])
    @answers = TicketAnswer.where(ticket_id: params[:id]).order(id: :desc)
    respond_to do |format|
      format.html
      # format.js
    end
  end

  def new
    @ticket = Ticket.new
    @people = Person.where(client_id: 20 , active: true )
    @clients = Client.all
    respond_to do |format|
      if current_user.rol.name == 'Administrador'
        format.html
        format.js
      else 
        format.html { render 'new_view_client' }
      end

    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def create
    @ticket = Ticket.new(ticket_params)

    @ticket.user_id = current_user.id

    if params[:assigned_to] == ""
      @ticket.ticket_status_id = 1
    else 
      @ticket.ticket_status_id = 2
    end

    if current_user.rol.name == 'Cliente'
      @ticket.ticket_type_id = 5

      @ticket.client_id = current_user.person.client_id
      @ticket.person_id = current_user.person.id
      @ticket.report = true
    end

    if @ticket.report
      # Los tickets de los clientes siempre tienen report true
      @email = Person.where(client_id: @ticket.client_id , person_type_id: 2 ).where.not(id: current_user.person_id).pluck(:email)
      if current_user.rol.name == 'Cliente'
        @email.insert(0, current_user.email)
      end 
    end
      

    respond_to do |format|
      if @ticket.save!
        if params[:ticket_type_id] == 1
          if @ticket.report
            UserMailer.with(ticket: @ticket).ticket_soporte_tecnico.deliver_later!
          else
            UserMailer.with(ticket: @ticket).ticket_soporte_tecnico.deliver_later!
          end
        else 
          if @ticket.report
            UserMailer.with(ticket: @ticket, user_email: current_user.email, rol: current_user.rol.name, email: @email).ticket_varios.deliver_later!
          else
            UserMailer.with(ticket: @ticket, user_email: current_user.email, rol: current_user.rol.name).ticket_varios.deliver_later!
          end
        end

        format.html { redirect_to tickets_path, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        # format.html { redirect_to tickets_path, notice: 'Client was successfully updated.' }
        # format.json { render :show, status: :ok, location: @client }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def close_ticket
    @answer = TicketAnswer.new
    @answer.ticket_id = params[:id]
    @answer.detail = params[:detail]
    @answer.user_id = current_user.id

    if @ticket.report
      # Los tickets de los clientes siempre tienen report true
      @email = Person.where(client_id: @ticket.client_id , person_type_id: 2 ).where.not(id: current_user.person_id).pluck(:email)
      if current_user.rol.name == 'Cliente'
        @email.insert(0, current_user.email)
      end 
    end

    respond_to do |format|
      if @answer.save!
        if @ticket.update(ticket_status_id: 3)
          UserMailer.with(ticket: @ticket, answer: @answer, email: @email).ticket_answer.deliver_later!
          format.json { render 'success', status: :created }
          format.js
        else 
          format.json { render json: @ticket.errors }
        end
      else
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def assign_person
    respond_to do |format|
      if @ticket.update(assigned_to: params[:assigned_to], ticket_status_id: 2)
        format.json { render json: { status: true }, status: :ok }
      end
    end
  end

  def destroy
    if @ticket.update(active: false)
      redirect_to tickets_path, notice: 'Ticket dado de baja con éxito.'
    else
      edirect_to tickets_path, notice: 'ERROR: No se pudo dar de baja al ticket.'
    end
  end

  def get_fleets
    @fleets = Fleet.where(client_id: :client_id)
    respond_to do |format|
      format.json { render json: @fleets }
    end
  end

  def get_closed_tickets
    @closed_tickes = Tickets.where(active: true, state_ticket: 'closed')
    respond_to do |format|
      format.json
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:client_id, :fleet_id, :user_id, :person_id, :assigned_to, :detail,
                                     :ticket_status_id, :ticket_type_id, :ticket_priority_id, :title, :report, :active, images: [] )
    end
end
