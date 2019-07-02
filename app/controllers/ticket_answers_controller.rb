class TicketAnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = TicketAnswer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = TicketAnswer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @ticket = Ticket.find(params[:ticket_id])

    if @ticket.ticket_status_id == 3
      @ticket.update(ticket_status_id: 2)
    end

    @answer = @ticket.ticket_answers.create(answer_params)
    @answer.user_id = current_user.id
    @answer.active = true

    if @ticket.report
      # Los tickets de los clientes siempre tienen report true
      @email = Person.where(client_id: @ticket.client_id , person_type_id: 2 ).where.not(id: current_user.person_id).pluck(:email)
      if current_user.rol.name == 'Cliente'
        @email.insert(0, current_user.email)
      end 
    end

    respond_to do |format|
      if @answer.save
        @ticket = Ticket.find(@answer.ticket_id)
        UserMailer.with(ticket: @ticket, answer: @answer, email: @email).ticket_answer.deliver_later!
        format.html { redirect_to tickets_path, notice: 'Answer was successfully created.' }
        # format.json { render json: {status: true}, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.active = false
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = TicketAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      # params.fetch(:answer, {})
      params.require(:ticket_answer).permit(:detail, images: [])
    end
end
