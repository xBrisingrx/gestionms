class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy, :disable]

  # GET /people
  # GET /people.json
  def index
    @title = 'Personas'
    @client = Client.find(params[:client_id])
    @people = Person.where(client_id: params[:client_id], active: true)
    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @client = Client.find(params[:client_id])
    @person = Person.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def get_for_client
    @person = Person.find(params[:client_id])
    respond_to do |format|
      format.json
    end
  end

  # GET /people/new
  def new
    @client = Client.find(params[:client_id])
    @person_types = PersonType.where(active: :true).order(name: :asc)
    respond_to do |format|
      format.js
    end
  end

  # GET /people/1/edit
  def edit
    @client = Client.find(params[:client_id])
    @person_types = PersonType.where(active: :true).order(name: :asc)
    respond_to do |format|
      format.js
    end
  end

  # POST /people
  # POST /people.json
  def create
    @client = Client.find(params[:client_id])
    @person = @client.people.create(person_params)

    respond_to do |format|
      if @person.save
        format.js
        format.json { render json: {status: 'success'}, status: :created }
      else
        format.js
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        @alert = { 'type' => 'success', 'msg' => 'Persona actualizada con éxito!' }
        format.js
        format.json { render json: 'success', status: :created, location: @person }
      else
        @alert = { 'type' => 'error', 'msg' => 'Ocurrio un error: no se pudieron actualizar los datos.' }
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.update(active: false)
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      # format.json { head :no_content }
      format.json { render status: ok }
    end
  end

  def disable
    respond_to do |format|
      if @person.update(active: false)
        format.json { render json: { status: :success }, status: :ok }
      else
        format.json { render json: 'error', status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:person_type_id, :name, :surname, :dni, :email, :phone, :active, :client_id)
    end
end
