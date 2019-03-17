class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy, :close_ticket]
  # Es lo mismo que escribir
  # self.before_action(:set_person, {:only => [:show, :edit, :update, :destroy]})
  # es lo mismo, porque por un conjunto de reglas de ruby , tenés que el último
  # parámetro que se le manda a un método, se asume que es un hash, y por eso podés no poner los {}
  # y como es ruby, se pueden omitir los (), y como el => se puede reemplazar por : cuando la key del hash es un simbolo...

  # GET /clients
  # GET /clients.json
  def index
    @title = 'Tickets'
    @all_tickets = Ticket.group(:ticket_status_id).count
    @table_open = { title: 'Tickets sin asignar', id: 'open_tickets_table', total: @all_tickets[1] }
    @table_process = { title: 'Tickets en proceso', id: 'process_tickets_table', total: @all_tickets[2] }
    @table_closed = { title: 'Tickets finalizados', id: 'closed_tickets_table', total: @all_tickets[3] }

    # UserMailer.welcome_email.deliver
    respond_to do |format|
      format.html
      format.json { render json: Ticket.group(:ticket_status_id).count }
    end
  end

  def get_tickets 
    @open_tickets = Ticket.where(active: true, ticket_status_id: params[:ticket_status_id] )
    respond_to do |format|
      format.json { render :index }
    end
  end

  def count_tickets
    @count_tickets = Ticket.group(:ticket_status_id).count
    respond_to do |format|
      format.json { render :json => @count_tickets }
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
    @people = Person.where(client_id: 1 , active: true )
    # @users = User.all
    @clients = Client.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /clients/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /clients
  # POST /clients.json
  def create
    @ticket = Ticket.new(ticket_params)

    @ticket.user_id = current_user.id
    
    if params[:assigned_to].nil?
      @ticket.ticket_status_id = 2
    else 
      @ticket.ticket_status_id = 1
    end

    respond_to do |format|
      if @ticket.save!
        UserMailer.with(ticket: @ticket).welcome_email.deliver_later!
        format.html { redirect_to tickets_path, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
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
    respond_to do |format|
      if @ticket.update(ticket_status_id: 3) and @answer.save
        format.json { render json: { status: true }, status: :ok }
      else
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
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
                                     :ticket_status_id, :ticket_type_id, :ticket_priority_id, :title, :report, :active)
    end
end
