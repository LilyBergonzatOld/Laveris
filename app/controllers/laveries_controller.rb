class LaveriesController < ApplicationController
  before_action :set_lavery, only: [:show, :edit, :update, :destroy]

  # GET /laveries
  # GET /laveries.json
  def index
    @laveries = Laverie.all
  end

  # GET /laveries/1
  # GET /laveries/1.json
  def show
  end

  # GET /laveries/new
  def new
    @lavery = Laverie.new
  end

  # GET /laveries/1/edit
  def edit
  end

  # POST /laveries
  # POST /laveries.json
  def create
    @lavery = Laverie.new(lavery_params)

    respond_to do |format|
      if @lavery.save
        format.html { redirect_to @lavery, notice: 'Laverie was successfully created.' }
        format.json { render :show, status: :created, location: @lavery }
      else
        format.html { render :new }
        format.json { render json: @lavery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laveries/1
  # PATCH/PUT /laveries/1.json
  def update
    respond_to do |format|
      if @lavery.update(lavery_params)
        format.html { redirect_to @lavery, notice: 'Laverie was successfully updated.' }
        format.json { render :show, status: :ok, location: @lavery }
      else
        format.html { render :edit }
        format.json { render json: @lavery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laveries/1
  # DELETE /laveries/1.json
  def destroy
    @lavery.destroy
    respond_to do |format|
      format.html { redirect_to laveries_url, notice: 'Laverie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lavery
      @lavery = Laverie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lavery_params
      params.require(:lavery).permit(:laverie_id, :name, :nbmaxpers, :numtel, :numrue, :librue, :cdpost, :libville)
    end
end
