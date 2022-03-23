class UniversesController < ApplicationController
  before_action :set_universe, only: %i[ show edit update destroy ]

  # GET /universes or /universes.json
  def index
    @universes = Universe.all
  end

  # GET /universes/1 or /universes/1.json
  def show
  end

  # GET /universes/new
  def new
    @universe = Universe.new
  end

  # GET /universes/1/edit
  def edit
  end

  # POST /universes or /universes.json
  def create
    @universe = Universe.new(universe_params)

    if @universe.end_time.blank? and @universe.timestep.present? and @universe.number_of_timesteps.present?
      @universe.end_time = (@universe.start_time + (@universe.timestep * @universe.number_of_timesteps))
    elsif @universe.end_time.present? and @universe.timestep.blank? and @universe.number_of_timesteps.present?
      @universe.timestep = ((@universe.end_time - @universe.start_time) / @universe.number_of_timesteps)
    elsif @universe.end_time.present? and @universe.timestep.present? and @universe.number_of_timesteps.blank?
      @universe.number_of_timesteps = ((@universe.end_time - @universe.start_time) / @universe.timestep).ceil
    end


    respond_to do |format|
      if @universe.save
        format.html { redirect_to universe_url(@universe), notice: "Universe was successfully created." }
        format.json { render :show, status: :created, location: @universe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @universe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /universes/1 or /universes/1.json
  def update
    respond_to do |format|
      if @universe.update(universe_params)
        format.html { redirect_to universe_url(@universe), notice: "Universe was successfully updated." }
        format.json { render :show, status: :ok, location: @universe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @universe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /universes/1 or /universes/1.json
  def destroy
    @universe.destroy

    respond_to do |format|
      format.html { redirect_to universes_url, notice: "Universe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_universe
      @universe = Universe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def universe_params
      params.require(:universe).permit(:simulation_id, :start_time, :end_time, :timestep, :number_of_timesteps)
    end
end
