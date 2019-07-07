class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :set_types, only: [:new, :edit]
  # Es lo mismo que escribir
  # self.before_action(:set_person, {:only => [:show, :edit, :update, :destroy]})
  # es lo mismo, porque por un conjunto de reglas de ruby , tenés que el último
  # parámetro que se le manda a un método, se asume que es un hash, y por eso podés no poner los {}
  # y como es ruby, se pueden omitir los (), y como el => se puede reemplazar por : cuando la key del hash es un simbolo...

  def index
    @title = 'Clientes'
    @clients = Client.where(active: true).order(name: :asc)

    respond_to do |format|
      format.xlsx {
      response.headers[
        'Content-Disposition'
      ] = "attachment; filename='clientes.xlsx'" }
      format.html
      format.json
    end
  end

  def show
    @client = Client.find(params[:id])
    respond_to do |format|
      format.js
    end
  end


  def new
    @client = Client.new
    respond_to do |format|
      format.js
    end
  end


  def edit
    respond_to do |format|
      format.js
    end
  end

  def create
    @client = Client.new(client_params)
    @client.comment = "No hay comentario"
    respond_to do |format|
      if @client.save
        format.js
        format.json { render json: { status: 'success' } , status: :created }
      else
        # format.html { render :new } 
        format.json { render json: @client.errors, status: :unprocessable_entity }

        # format.js 
      end
    end
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        # format.html { redirect_to clients_path, notice: 'Client was successfully updated.' }
        # format.js
        format.json { render json: { status: 'success' } , status: :created }
      else
        # format.html { render :edit }
        # format.js
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

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

    def set_client
      @client = Client.find(params[:id])
    end

    def set_types
      @client_types = ClientType.where(active: true).order(name: :asc)
      @sale_conditions = SaleCondition.where(active: true).order(condition: :asc)
      @iva_conditions = IvaCondition.where(active: true).order(condition: :asc)
    end

    def client_params
      params.require(:client).permit(:name, :cuit, :email, :direction, :location,
                                     :province, :phone, :client_type_id,:sale_condition_id,:iva_condition_id, :active)
    end
end
