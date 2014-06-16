class SculpturesController < ApplicationController
  before_action :set_sculpture, only: [:show, :edit, :update, :destroy]

  # GET /sculptures
  # GET /sculptures.json
  def index
    @sculptures = Sculpture.includes(:images).all
  end

  # GET /sculptures/1
  # GET /sculptures/1.json
  def show
  end

  # GET /sculptures/new
  def new
    @sculpture = Sculpture.new
    @sculpture.build_images
  end

  # GET /sculptures/1/edit
  def edit
    @sculpture.build_images
  end

  # POST /sculptures
  # POST /sculptures.json
  def create
    @sculpture = Sculpture.new(sculpture_params)

    respond_to do |format|
      if @sculpture.save
        format.html { redirect_to @sculpture, notice: 'Sculpture was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sculpture }
      else
        format.html { render action: 'new' }
        format.json { render json: @sculpture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sculptures/1
  # PATCH/PUT /sculptures/1.json
  def update
    respond_to do |format|
      if @sculpture.update(sculpture_params)
        format.html { redirect_to @sculpture, notice: 'Sculpture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sculpture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sculptures/1
  # DELETE /sculptures/1.json
  def destroy
    @sculpture.destroy
    respond_to do |format|
      format.html { redirect_to sculptures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sculpture
      @sculpture = Sculpture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sculpture_params
      params.require(:user).permit(:title, :wide, :dipth, :high, :madedate, :categoryno, :image)
    end
end
