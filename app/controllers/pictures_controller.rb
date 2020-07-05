class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    if current_user
      @nav = "pictures"
      @pictures = Picture.all.sort_by { |picture| picture.exam }
    else
      redirect_to root_url
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    if current_user
    else
      redirect_to root_url
    end
  end

  # GET /pictures/new
  def new
    if current_user
      @picture = Picture.new
      render :layout => 'upload'
    else
      redirect_to root_url
    end
  end

  # GET /questions/1/edit
  def edit
    if current_user
      @nav = "pictures"
    else
      redirect_to root_url
    end
  end

  # POST /pictures
  # POST /pictures.json
  def create
    if current_user
      @picture = Picture.new(picture_params)
      respond_to do |format|
        if @picture.save
          format.html { redirect_to new_picture_path, notice: 'Picture was successfully created.' }
          format.json { render :show, status: :created, location: @picture }
        else
          format.html { redirect_to new_picture_path }
        end
      end
    else
      redirect_to root_url
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    if current_user
      render :layout => 'upload'
      respond_to do |format|
        if @picture.update(picture_params)
          format.html { redirect_to new_picture_path, notice: 'Picture was successfully updated.' }
          format.json { render :show, status: :ok, location: @picture }
        else
          format.html { render :edit }
          format.json { render json: @picture.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_url
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    if current_user
      @picture.destroy
      respond_to do |format|
        format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def picture_params
      params.require(:picture).permit(:image, :exam)
    end
end
