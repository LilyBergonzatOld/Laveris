class LaundromatsController < ApplicationController
  before_action :set_laundromat, only: [:show, :edit, :update, :destroy]

  # GET /laundromats
  # GET /laundromats.json
  def index
    @laundromats = Laundromat.all
  end

  # GET /laundromats/1
  # GET /laundromats/1.json
  def show
  end

  # GET /laundromats/new
  def new
    @laundromat = Laundromat.new
  end

  # GET /laundromats/1/edit
  def edit
  end

  # POST /laundromats
  # POST /laundromats.json
  def create
    @laundromat = Laundromat.new(laundromat_params)

    respond_to do |format|
      if @laundromat.save
        format.html { redirect_to @laundromat, notice: 'Laundromat was successfully created.' }
        format.json { render :show, status: :created, location: @laundromat }
      else
        format.html { render :new }
        format.json { render json: @laundromat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laundromats/1
  # PATCH/PUT /laundromats/1.json
  def update
    respond_to do |format|
      if @laundromat.update(laundromat_params)
        format.html { redirect_to @laundromat, notice: 'Laundromat was successfully updated.' }
        format.json { render :show, status: :ok, location: @laundromat }
      else
        format.html { render :edit }
        format.json { render json: @laundromat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laundromats/1
  # DELETE /laundromats/1.json
  def destroy
    @laundromat.destroy
    respond_to do |format|
      format.html { redirect_to laundromats_url, notice: 'Laundromat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laundromat
      @laundromat = Laundromat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def laundromat_params
      params.require(:laundromat).permit(:name, :capacity, :phone, :nbstreet, :libstreet, :zipcode, :libcity)
    end
end
