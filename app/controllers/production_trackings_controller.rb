class ProductionTrackingsController < ApplicationController
  before_action :set_production_tracking, only: [:show, :edit, :update, :destroy]
  before_action :sort_users, only: [:new, :edit, :create, :update]

  def index
    @production_trackings = ProductionTracking.all
  end

  def show
  end


  def new
    @production_tracking = ProductionTracking.new
  end

  def edit
  end

  def create
    @production_tracking = ProductionTracking.new(production_tracking_params)

    respond_to do |format|
      if @production_tracking.save
        format.html { redirect_to :back, notice: 'Production tracking was successfully created.' }
        format.json { render :show, status: :created, location: @production_tracking }
      else
        format.html { render :new }
        format.json { render json: @production_tracking.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @production_tracking.update(production_tracking_params)
        format.html { redirect_to :back, notice: 'Production tracking was successfully updated.' }      
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @production_tracking.destroy
    respond_to do |format|
      format.html { redirect_to production_trackings_url, notice: 'Production tracking was successfully destroyed.' }
    end
  end

  private
    def sort_users
      @games = Game.select {|g| g.production_tracking.nil? }
      @designers = Employee.where(type_of_work: "designer")
      @illustrators = Employee.where(type_of_work: "illustrator")
      @writers = Employee.where(type_of_work: "writer")
      @composers = Employee.where(type_of_work: "composer")
      @developers = Employee.where(type_of_work: "developer")
    end
    def set_production_tracking
      @production_tracking = ProductionTracking.find(params[:id])
    end

    def production_tracking_params
      params.require(:production_tracking).permit(:game_id, :designer_id, :illustrator_id, :writer_id, :composer_id, :developer_id, :live)
    end
end
