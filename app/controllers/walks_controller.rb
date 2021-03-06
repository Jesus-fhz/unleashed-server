class WalksController < ApplicationController

  before_action :set_walk, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token, raise: false

  # GET /walks or /walks.json
  def index
    headers['Access-Control-Allow-Origin'] = '*'
    @walks = Walk.all
    @pets = @walks.map{ |walk| walk.pet }

    render :json => {walks: @walks, pets: @pets}
  end

  # GET /walks/1
  def show
    headers['Access-Control-Allow-Origin'] = '*'

    @walk = Walk.find params[:id]

    render json: @walk, include: :user
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
        format.json { render json:@walk, status: :created, location: @walk }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @walk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /walks/1 or /walks/1.json
  def update
    headers['Access-Control-Allow-Origin'] = '*'
    
    @walk = Walk.find params[:id]

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

  ###########################
  # OWNER SPECIFIC METHODS #
  ###########################

  # the owner's location who is attached to the walk instance. 
  # GET /walks/:id/walker/loc/ (WHERE :id is WALK ID)
  def show_walker_loc
    headers['Access-Control-Allow-Origin'] = '*'
    @user = Walk.find(params[:id]).user

    render :json => { lat: @user.latitude, lng: @user.longitude }
  end
  
  # the walker's location who is attached to the walk instance. 
  # GET /walks/:id/owner/loc/ (WHERE :id is WALK ID)
  def show_owner_loc
    headers['Access-Control-Allow-Origin'] = '*'
    @user = Walk.find(params[:id]).pet.user

    render :json => { lat: @user.latitude, lng: @user.longitude }
  end
    
  # GET /walks/accepted/:id A call by the OWNER showing the walk, 
  def show_accepted_walk_pet_walker # NOTE: this returns the walks and their pets wrapped in a hash
    # create a hash to include pet aswell
    @walk = Walk.find params[:id]
    @pets = @walk.pet;
    @walker = @walk.user;
    # RETURNS hash of {walks: & pet:}
    # need pet and 
    render :json => {walks: @walk, pets: @pets, walker: @walker}
  end

  ###########################
  # WALKER SPECIFIC METHODS #
  ###########################

  # GET /walks/pending/:lat/:lng where lat and lng belong to Walker making the request
  def show_pending # NOTE: this returns the walks and their pets wrapped in a hash
    @walks = Walk.where(status: 0).near([params[:lat], params[:lng]], 100, units: :km); # change 5 to whatever range you want

    render json: @walks, include: :pet
  end
  
  # Changes the walker status to accepted
  # PATCH/PUT /walks/1/accepts TODO: NEED TO TEST
  def walker_accepts
    headers['Access-Control-Allow-Origin'] = '*'
    @walk = Walk.find(params[:id])

    if @walk.status = 0 # 0 is pending
      @walk.status = 1
      # @walk.save

      # respond_to do |format|
        if @walk.update(walk_params)
          render :json => @walk 

          # format.json { render :show, status: :ok, location: @walk }
        else
          # json { render json: @walk.errors, status: :unprocessable_entity } # we can clean up the error handling here. 
        end
      # end
    else
      #TODO: return an error message. 
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
      params.require(:walk).permit(:pet_id, :user_id, :status,:address,:cost, :duration, :latitude, :longitude, :special_instruction)
    end
end
