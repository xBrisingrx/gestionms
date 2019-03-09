class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :set_types, only: [:new, :edit]
  # Es lo mismo que escribir
  # self.before_action(:set_person, {:only => [:show, :edit, :update, :destroy]})
  # es lo mismo, porque por un conjunto de reglas de ruby , tenés que el último
  # parámetro que se le manda a un método, se asume que es un hash, y por eso podés no poner los {}
  # y como es ruby, se pueden omitir los (), y como el => se puede reemplazar por : cuando la key del hash es un simbolo...

  # GET /clients
  # GET /clients.json
  def index
    @title = 'Clientes'
    @clients = Client.where(active: true).order(name: :asc)

    respond_to do |format|
      # format.xlsx {
      # response.headers[
      #   'Content-Disposition'
      # ] = "attachment; filename='clientes.xlsx'" }
      format.html
      format.json
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # GET /clients/new
  def new
    @client = Client.new
    respond_to do |format|
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
    @client = Client.new(client_params)
    
    respond_to do |format|
      if @client.save
        # format.html { redirect_to clients_path, notice: 'Client was successfully created.' }
        format.js
        format.json { render json: { status: 'success' } , status: :created }
      else
        # format.html { render :new } 
        format.json { render json: @client.errors, status: :unprocessable_entity }

        # format.js 
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        # format.html { redirect_to clients_path, notice: 'Client was successfully updated.' }
        format.js
        format.json { render json: { status: 'success' } , status: :created }
      else
        # format.html { render :edit }
        format.js
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    if @client.update(active: false)
      redirect_to clients_path, notice: 'Cliente dado de baja con éxito.'
    else
      redirect_to clients_path, notice: 'ERROR: No se pudo dar de baja al cliente.'
    end
  end

  def disabled
    # los params que llegan desde el form son un hash dentro de otro
    @client = Client.find(params[:client][:id])
    respond_to do |format|
      if @client.update(active: false)
        format.json { render json: 'success' }
      else
        format.json { render json: 'error', status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    def set_types
      @client_types = ClientType.where(active: true).order(name: :asc)
      @sale_conditions = SaleCondition.where(active: true).order(condition: :asc)
      @iva_conditions = IvaCondition.where(active: true).order(condition: :asc)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :cuit, :email, :direction, :location,
                                     :province, :phone, :client_type_id,:sale_condition_id,:iva_condition_id, :active)
    end
end
