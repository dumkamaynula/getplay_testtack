class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :sort_users

  def index
    @games = Game.all
  end


  def show
  end


  def new
    @game = Game.new
  end


  def edit
  end


  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to games_path, notice: 'Game was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to games_path, notice: 'Game was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @game.destroy
    @game.photo = nil
    @game.save
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
    end
  end

  private

    def sort_users
      @games = Game.select {|g| g.production_tracking.nil? }
      @developers = Employee.where(type_of_work: "developer")
      @designers = Employee.where(type_of_work: "designer")
      @illustrators = Employee.where(type_of_work: "illustrator")
      @writers = Employee.where(type_of_work: "writer")
      @composers = Employee.where(type_of_work: "composer")
      @developers = Employee.where(type_of_work: "developer")
    end
   
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:name, :package_name, :store, :production_tracking_id, :photo)
    end
end
