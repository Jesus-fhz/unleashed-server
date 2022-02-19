class PetsController < ApplicationController

  skip_before_action :verify_authenticity_token,  raise: false
  before_action :set_pet, only: %i[ show edit update destroy ]

  # GET /pets or /pets.json
  def index
    headers['Access-Control-Allow-Origin'] = '*'
    @pets = Pet.all
  end

  # GET /pets/1 or /pets/1.json
  def show
    headers['Access-Control-Allow-Origin'] = '*'
  end

  def show_pet_walks
    headers['Access-Control-Allow-Origin'] = '*'
    @pet_walks = Pet.find(params[:id]).walks
    render :json => @pet_walks
  end

  # GET /pets/new
  def new
    headers['Access-Control-Allow-Origin'] = '*'
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
    headers['Access-Control-Allow-Origin'] = '*'
  end

  # POST /pets or /pets.json
  def create
    headers['Access-Control-Allow-Origin'] = '*'
    @pet = Pet.new(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to pet_url(@pet), notice: "Pet was successfully created." }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1 or /pets/1.json
  def update
    headers['Access-Control-Allow-Origin'] = '*'
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to pet_url(@pet), notice: "Pet was successfully updated." }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1 or /pets/1.json
  def destroy
    headers['Access-Control-Allow-Origin'] = '*'
    @pet.destroy

    respond_to do |format|
      format.html { redirect_to pets_url, notice: "Pet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pet_params
      params.require(:pet).permit(:user_id, :image, :name, :breed, :age, :is_male, :size, :desexed, :can_walk_offleash, :can_be_petted, :can_walk_with_other_dogs)
    end
end
