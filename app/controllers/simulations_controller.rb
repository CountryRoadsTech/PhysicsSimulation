# frozen_string_literal: true

# Defines all actions available to simulations through HTTP requests.
class SimulationsController < ApplicationController
  before_action :set_simulation, only: [:show, :edit, :update, :destroy]

  # GET /simulations or /simulations.json
  def index
    @simulations = Simulation.all
  end

  # GET /simulations/1 or /simulations/1.json
  def show
    # Pass the simulation data needed for rendering to the Javascript in the view.
    gon.physics_bodies = []
    @simulation.physics_bodies.each do |physics_body|
      # Scale down the values to prevent float overflow in ThreeJS rendering.
      scaled_position_x = physics_body.initial_position_x * Universe::RENDER_SCALE
      scaled_position_y = physics_body.initial_position_y * Universe::RENDER_SCALE
      scaled_position_z = physics_body.initial_position_z * Universe::RENDER_SCALE
      scaled_radius = physics_body.radius * Universe::RENDER_SCALE

      gon.physics_bodies << { name: physics_body.name,
                              x: scaled_position_x,
                              y: scaled_position_y,
                              z: scaled_position_z,
                              radius: scaled_radius }
    end

    # Redirect to the latest URL if an old slug was used.
    redirect_to @simulation, status: :moved_permanently unless request.path == simulation_path(@simulation)
  end

  # GET /simulations/new
  def new
    @simulation = Simulation.new
    @simulation.build_universe
  end

  # GET /simulations/1/edit
  def edit; end

  # POST /simulations or /simulations.json
  def create
    @simulation = Simulation.new(simulation_params)

    respond_to do |format|
      if @simulation.save
        format.html { redirect_to simulation_url(@simulation), notice: 'Simulation was successfully created.' }
        format.json { render :show, status: :created, location: @simulation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @simulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /simulations/1 or /simulations/1.json
  def update
    respond_to do |format|
      if @simulation.update(simulation_params)
        format.html { redirect_to simulation_url(@simulation), notice: 'Simulation was successfully updated.' }
        format.json { render :show, status: :ok, location: @simulation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @simulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simulations/1 or /simulations/1.json
  def destroy
    @simulation.destroy

    respond_to do |format|
      format.html { redirect_to simulations_url, notice: 'Simulation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_simulation
    @simulation = Simulation.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    # Render the 404 page if a slug was used that doesn't match any records.
    render file: "#{Rails.root}/public/404.html", status: :not_found and return
  end

  # Only allow a list of trusted parameters through.
  def simulation_params
    params.require(:simulation).permit(:name, :description, universe_attributes: [
                                         :id, :start_time, :end_time, :timestep, :number_of_timesteps
                                       ], physics_bodies_attributes: [
                                         :_destroy, :id, :name, :description, :initial_mass, :radius,
                                         :initial_position_x, :initial_position_y, :initial_position_z,
                                         :initial_velocity_x, :initial_velocity_y, :initial_velocity_z
                                       ])
  end
end
