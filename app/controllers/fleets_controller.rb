class FleetsController < ApplicationController
  before_action :set_fleet, only: [:show, :edit, :update, :destroy]

  # GET /fleets
  # GET /fleets.json
  def index
    @client = Client.find(params[:client_id])
    @fleets = Fleet.where(client_id: params[:client_id], active: true)
    respond_to do |format|
      format.html
      format.js
      format.json
    end
  end

  # GET /fleets/1
  # GET /fleets/1.json
  def show
  end

  # GET /fleets/new
  def new
    @client = Client.find(params[:client_id])
    @people = Person.where(client_id: params[:client_id])
    respond_to do |format|
      format.js
    end
  end

  # GET /fleets/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /fleets
  # POST /fleets.json
  def create
    @client = Client.find(params[:client_id])
    @fleet = @client.fleets.create(fleet_params)
    @fleet.active = true

    respond_to do |format|
      if @fleet.save
        format.html { redirect_to client_fleets_path(@client), notice: 'Fleet was successfully created.' }
        format.json { render :show, status: :created, location: @fleet }
        format.js
      else
        format.html { render :new }
        format.json { render json: @fleet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fleets/1
  # PATCH/PUT /fleets/1.json
  def update
    respond_to do |format|
      if @fleet.update(fleet_params)
        format.html { redirect_to @fleet, notice: 'Fleet was successfully updated.' }
        format.json { render :show, status: :ok, location: @fleet }
      else
        format.html { render :edit }
        format.json { render json: @fleet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fleets/1
  # DELETE /fleets/1.json
  def destroy
    @fleet.destroy
    respond_to do |format|
      format.html { redirect_to fleets_url, notice: 'Fleet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_fleets
    @fleets = Fleet.where(client_id: :client_id)
    format.json { render :json => @fleets }
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fleet
      @fleet = Fleet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fleet_params
      params.require(:fleet).permit(:type_fleet, :code, :ip_address, :hardware, :software, :client_id, :person_id, :active)
    end
end
