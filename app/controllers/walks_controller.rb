class WalksController < ApplicationController

  before_action :set_walk, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token, raise: false

  # GET /walks or /walks.json
  def index
    headers['Access-Control-Allow-Origin'] = '*'
    @walks = Walk.all
  end

  # GET /walks/1 or /walks/1.json
  def show
    headers['Access-Control-Allow-Origin'] = '*'
  end

  # GET /walks/new
  def new
    headers['Access-Control-Allow-Origin'] = '*'
    @walk = Walk.new
  end

  # GET /walks/1/edit
  def edit
    headers['Access-Control-Allow-Origin'] = '*'
  end

  #TODO: we need to make sure this has the associated user id to correctly assign information. 
  # POST /walks or /walks.json
  def create
    headers['Access-Control-Allow-Origin'] = '*'
    @walk = Walk.new(walk_params)

    respond_to do |format|
      if @walk.save
        format.html { redirect_to walk_url(@walk), notice: "Walk was successfully created." }
        format.json { render :show, status: :created, location: @walk }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @walk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /walks/1 or /walks/1.json
  def update
    headers['Access-Control-Allow-Origin'] = '*'
    respond_to do |format|
      if @walk.update(walk_params)
        format.html { redirect_to walk_url(@walk), notice: "Walk was successfully updated." }
        format.json { render :show, status: :ok, location: @walk }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @walk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /walks/1 or /walks/1.json
  def destroy
    headers['Access-Control-Allow-Origin'] = '*'
    @walk.destroy

    respond_to do |format|
      format.html { redirect_to walks_url, notice: "Walk was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_walk
      @walk = Walk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def walk_params
      params.require(:walk).permit(:pet_id, :user_id, :status, :cost, :duration, :geocode_lat, :geocode_lng, :special_instruction)
    end
end
