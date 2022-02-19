class UsersController < ApplicationController

  before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token, raise: false

  # before_action :authenticate_user

  def current
    render json: current_user
  end

  # GET /users or /users.json
  def index
    headers['Access-Control-Allow-Origin'] = '*'
    @users = User.all
  end
  
  # GET /users/1 or /users/1.json
  def show
    headers['Access-Control-Allow-Origin'] = '*'
  end

  # GET /users/:id/pets
  def show_owned_pets
    headers['Access-Control-Allow-Origin'] = '*'
    @user_pets = User.find(params[:id]).pets
    render :json => @user_pets
  end

  def show_user_walks
    headers['Access-Control-Allow-Origin'] = '*'
    @user_walks = User.find(params[:id]).walks
    render :json => @user_walks
  end
  
  # renders an array of the users that are walkers within a range of the input 'lat' & 'lng'
  # GET /users/find/:lat/:lng TODO: DO THE TESTING FOR THIS ROUTE
  def show_nearby_walkers
    @all_walkers = User.walker # modify this to only show the ones within geocode range
    lat_range = (params["lat"].to_f - 0.0001)..(params["lat"].to_f + 0.0001) #TODO: consider changing this value later on
    lng_range = (params["lng"].to_f - 0.0001)..(params["lng"].to_f + 0.0001)

    @nearby_walkers = @all_walkers.where( geocode_lat: lat_range, geocode_lng: lng_range)
    
    render :json => @nearby_walkers 
  end

  # GET /users/new
  def new
    headers['Access-Control-Allow-Origin'] = '*'
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    headers['Access-Control-Allow-Origin'] = '*'
  end

  
  # POST /users or /users.json
  def create
    headers['Access-Control-Allow-Origin'] = '*'
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    headers['Access-Control-Allow-Origin'] = '*'
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    headers['Access-Control-Allow-Origin'] = '*'
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :user_type, :address, :is_available, :earnings, :geocode_lat, :geocode_lng)
    end
end
