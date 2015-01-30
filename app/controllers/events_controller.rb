class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    flash.now[:notice] = @event.message
    @subscribed = User.find(session[:id]).subscribed_events.include?(Event.find(params[:id]))
  end

  # GET /events/1/subscribe
  def subscribe
    if session[:id]
      me = User.find(session[:id])
      event = Event.find(params[:id])

      me.subscribed_events.push(event)
      me.save

      event.subscribed_users.push(me)
      event.save

      redirect_to event
    else
      redirect_to root_path, notice: 'Vous n\'êtes pas connecté'
    end
  end

  # GET /events/new
  def new
    @event = Event.new
    @users = User.all
    @laundromats = Laundromat.all
    me = @users.select { |user| user.id == session[:id] }
    @avatar = me[0].avatar
  end

  # GET /events/1/edit
  def edit
    @users = User.all
    @laundromats = Laundromat.all
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'L\'événement a été créée avec succès' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to events_path, notice: 'L\'événement a été modifié avec succès' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'L\'événement a été supprimé avec succès' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :message, :date, :user_id, :laundromat_id)
    end
end
